import sys, os
sys.path.append(os.pardir)
from dataset.mnist import load_mnist

def smoke():
    (x_train, y_train), (x_test, y_test) = load_mnist(flatten=True, normalize=False)
    print(x_train.shape)
    print(y_train.shape)
    print(x_test.shape)
    print(y_test.shape)

if __name__ == "__main__":
    smoke()