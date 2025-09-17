def calc(num1, num2, operation):
    result = 0
    # operation=('+','-','*','/')
    if operation == '+':
        result = num1 + num2
    elif operation == '-':
        result = num1 - num2
    elif operation == '*':
        result = num1 * num2
    elif operation == '/':
       result = num1 / num2   
    else:
        print('Please enter a valid operation and number')

    return result
num1=float(input('Enter your first number '))
num2=float(input('Enter your second number ')) 
operation = input('Enter your preferred operation ')
print(calc(num1, num2, operation))