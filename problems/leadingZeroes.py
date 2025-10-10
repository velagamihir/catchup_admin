nums=list(map(int,input().split()))
x=0
c=1
if len(nums)==1:
    print(nums)
else:
    while c!=len(nums):
        if nums[c]!=0:
            if nums[x]==0:
                temp=nums[x]
                nums[x]=nums[c]
                nums[c]=temp
            else:
                x+=1
                c+=1
        else:
            if nums[x]!=0:
                x+=1
                c+=1
            else:
                c+=1
print (nums)
