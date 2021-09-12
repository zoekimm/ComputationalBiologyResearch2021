import itertools
import pandas as pd

class chromosome_identifier:

    def __init__(self, filename):
        self.f = open(filename, 'r')
        self.df = []
        
    def preprocess(self):
        # expects the file to have the name of the chromosome
        # on the left and the size on the right with a new line character

        count = 0
        chrom = []
        size = []
        word_list = []

        for words in self.f:
            word_list.append(words.split()) #tokenize by space 

        for word in list(itertools.chain(*word_list)): #flatten the list 
            if count % 2 == 0:
                chrom.append(word)
            else:
                size.append(word)
            count += 1
        
        df = pd.DataFrame({'Chromosome': chrom, 'Size': size})
        df['Size'] = df['Size'].astype(str).astype(int)

        return df.sort_values('Size') #sort the dataframe in an ascending order by size 
