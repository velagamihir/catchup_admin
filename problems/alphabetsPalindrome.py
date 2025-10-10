code=input()
result=""
alphabets='abcdefghijklmnopqrstuvwxyz'
code=code.lower()
print(code)
for i in code:
    if i in alphabets:
        result+=i
