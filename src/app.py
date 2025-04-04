from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

class KeyValueStore:
    def __init__(self):
        self.data = {}

    def get(self, key):
        return self.data.get(key, None)

    def put(self, key, value):
        self.data[key] = value

    def delete(self, key):
        if key in self.data:
            del self.data[key]

class LeaderNode(KeyValueStore):
    def __init__(self, followers):
        super().__init__()
        self.followers = followers

    def put(self, key, value):
        super().put(key, value)
        self.replicate_to_followers('put', key, value)

    def delete(self, key):
        super().delete(key)
        self.replicate_to_followers('delete', key)

    def replicate_to_followers(self, action, key, value=None):
        for follower in self.followers:
            try:
                if action == 'put':
                    requests.post(f'http://{follower}/replicate/put', json={'key': key, 'value': value})
                elif action == 'delete':
                    requests.post(f'http://{follower}/replicate/delete', json={'key': key})
            except requests.exceptions.RequestException as e:
                print(f"Failed to replicate to {follower}: {e}")

class FollowerNode(KeyValueStore):
    def __init__(self):
        super().__init__()
        self.last_replicated_key = None  # Track the last replicated key for debugging

    def replicate_put(self, key, value):
        """
        Apply a replicated PUT operation from the leader.
        """
        self.put(key, value)
        self.last_replicated_key = key
        file1 = open("replication.log", "a")
        file1.write(f"Follower: Replicated PUT key={key}, value={value}")
        file1.close()

    def replicate_delete(self, key):
        """
        Apply a replicated DELETE operation from the leader.
        """
        self.delete(key)
        self.last_replicated_key = key
        file1 = open("replication.log", "a")
        file1.write(f"Follower: Replicated DELETE key={key}")
        file1.close()

# Configuration
LEADER_PORT = 5000
FOLLOWER_PORTS = [5001, 5002]

# Initialize nodes
leader = LeaderNode([f'localhost:{port}' for port in FOLLOWER_PORTS])
followers = [FollowerNode() for _ in FOLLOWER_PORTS]

# Leader routes
@app.route('/put', methods=['POST'])
def put():
    data = request.json
    key = data['key']
    value = data['value']
    leader.put(key, value)
    return jsonify({'status': 'success'})

@app.route('/get/<key>', methods=['GET'])
def get(key):
    value = leader.get(key)
    return jsonify({'key': key, 'value': value})

@app.route('/delete', methods=['POST'])
def delete():
    key = request.json['key']
    leader.delete(key)
    return jsonify({'status': 'success'})

# Follower routes
@app.route('/replicate/put', methods=['POST'])
def replicate_put():
    data = request.json
    key = data['key']
    value = data['value']
    followers[FOLLOWER_PORTS.index(int(request.host.split(':')[-1]))].replicate_put(key, value)
    return jsonify({'status': 'success'})

@app.route('/replicate/delete', methods=['POST'])
def replicate_delete():
    key = request.json['key']
    followers[FOLLOWER_PORTS.index(int(request.host.split(':')[-1]))].replicate_delete(key)
    return jsonify({'status': 'success'})

@app.route('/follower/get/<key>', methods=['GET'])
def follower_get(key):
    follower = followers[FOLLOWER_PORTS.index(int(request.host.split(':')[-1]))]
    value = follower.get(key)
    return jsonify({'key': key, 'value': value})

# Run the app
if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Usage: python app.py <leader|follower> <port>")
        sys.exit(1)

    role = sys.argv[1]
    port = int(sys.argv[2])

    if role == 'leader':
        app.run(port=port)
    elif role == 'follower':
        app.run(port=port)
    else:
        print("Invalid role. Use 'leader' or 'follower'.")
