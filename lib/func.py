import numpy as np

def step_function(x):
    if x > 0:
        return 1
    else:
        return 0

def sigmoid(x):
    return 1 / (1 + np.exp(-x))
    # return 0.0 if x<-709 else 1/(1+np.exp(-x))

def relu(x):
    return np.maximum(0, x)

def softmax(x):
    return np.exp(x) / np.sum(np.exp(x))