import itertools
import pandas as pd

class chromosome_identifier:

    def __init__(self):
        self.genome_size = 0
        self.number_of_chrom = 0
        self.chrom_mean_length = 0 
        self.result_df = []
        
    def preprocess(self, f):
        # expects the file to have the name of the chromosome
        # on the left and the size on the right with a new line character

        count = 0
        chrom = []
        size = []
        word_list = []

        for words in f:
            word_list.append(words.split()) #tokenize by space 

        for word in list(itertools.chain(*word_list)): #flatten the list 
            if count % 2 == 0:
                chrom.append(word)
            else:
                size.append(word)
            count += 1
        
        df = pd.DataFrame({'Chromosome': chrom, 'Size': size})
        df['Size'] = df['Size'].astype(str).astype(int)

        self.genome_size = df['Size'].sum() 
        self.number_of_chrom = len(df.index) 
        self.chrom_mean_length = df['Size'].mean() 

        return df.sort_values('Size') #sort the dataframe in an ascending order by size 


    def identify(self, filename):

        f = open(filename, 'r')

        df = self.preprocess(f)

        self.result_df = self.result_df.append({'Species' : filename, 'Total Size': self.genome_size, 'Number of chromosomes': self.number_of_chrom, 
                    'Largest Chromosome Name' : str(df['Size'].iloc[0]), 
                    'Largest Chromosome Size' : str(df['Chromosome'].iloc[0]),
                    'Smallest Chromosome Name' : str(df['Chromosome'].iloc[self.number_of_chrom - 1]), 
                    'Smallest Chromosome Size' : str(df['Size'].iloc[self.number_of_chrom - 1]),
                    'Average chromosome length' : self.chrom_mean_length}, ignore_index = True)

    def __call__(self, filelist):
        
        for filename in filelist:
            self.identify(filename)

        self.result_df = self.result_df.set_index('Species')

        return self.result_df



