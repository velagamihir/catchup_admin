orderNumbers = list(map(int, input().split()))
if orderNumbers == []:
    print(1)
else:
    # if the input list is not empty
    maxNumber = max(orderNumbers)  # finding the maximum number in the list
    missingLeastPositiveNumber = 0  # the resultant number
    for i in range(
        1, maxNumber
    ):  # iterating the loop from 1 to the maximum number of the list to find the missing number
        if i not in orderNumbers:
            missingLeastPositiveNumber = i
            break
    if missingLeastPositiveNumber==0:
        missingLeastPositiveNumber=maxNumber+1
    print(missingLeastPositiveNumber)
