class kmers_list:

    def __init__(self):
        self.li = []

    def extract_kmers(self, seq, num): 
        self.li = []
        for i in range(0, len(seq) - num + 1):
            self.li.append(seq[i: i + num])
        return self.li

    def create_list(self, filename):
        count = 1
        #.fa format 
        with open(filename, 'w') as f: 
            for k in self.li:
                f.write('>read' + str(count) + '\n')
                count = count + 1
                f.write('%s\n' % k)

