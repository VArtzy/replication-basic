class FollowerNode(KeyValueStore):
    def replicate_put(self, key, value):
        self.put(key, value)

    def replicate_delete(self, key):
        self.delete(key)
