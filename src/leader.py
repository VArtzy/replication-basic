class LeaderNode(KeyValueStore):
    def __init__(self, followers):
        super().__init__()
        self.followers = followers

    def put(self, key, value):
        super().put(key, value)
        for follower in self.followers:
            follower.replicate_put(key, value)

    def delete(self, key):
        super().delete(key)
        for follower in self.followers:
            follower.replicate_delete(key)
