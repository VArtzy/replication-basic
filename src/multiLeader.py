class MultiLeaderNode(KeyValueStore):
    def __init__(self, peers):
        super().__init__()
        self.peers = peers

    def put(self, key, value):
        super().put(key, value)
        for peer in self.peers:
            peer.replicate_put(key, value)

    def replicate_put(self, key, value):
        if key not in self.data or self.data[key] < value:
            self.put(key, value)
