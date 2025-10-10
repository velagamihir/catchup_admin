def longesSubArray(numberOfElements, listOfElements):
    # function to find the longest subarray of the array "listOfElements" of size 'n'
    listOfElements.sort()
    count = 0
    temp = 0
    for i in range(numberOfElements):
        for j in range(i + 1, numberOfElements):
            absoluteDifference = abs(listOfElements[i] - listOfElements[j])
            if absoluteDifference <= 1:
                temp += 1
            else:
                count = max(count, temp)
                temp = 0
    return count+1


def main():
    numberOfElements = int(input("Enter the number of elements: "))
    listOfElements = list(map(int, input().split()))
    print(longesSubArray(numberOfElements, listOfElements))


main()
