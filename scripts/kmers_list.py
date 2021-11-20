class kmers_list:

    def __init__(self):
        self.li = []

    def extract_kmers(self, seq, num): 
        self.li = []
        for i in range(0, len(seq) - num + 1):
            self.li.append(seq[i: i + num])
        return self.li

