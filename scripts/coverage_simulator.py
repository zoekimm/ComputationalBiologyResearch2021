import random
import numpy as np
import collections
import matplotlib.pyplot as plt

def initialze_array(total_length, base_length, coverage): 
    read = int((total_length * coverage) / (base_length))
    maxStart = total_length - base_length
    arr = [0] * total_length 
        
    for i in range(0, read):
        #get random start position
        start = random.randint(0, maxStart)
        for j in range(0, base_length):
            arr[start + j] += 1
   