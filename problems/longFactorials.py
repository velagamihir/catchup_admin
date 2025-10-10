numberToFindFactorial=int(input())
factorial=1
for i in range(2,numberToFindFactorial+1):
    factorial*=i
print(factorial)