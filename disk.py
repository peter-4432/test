def calc_disc(price, discount_percent):
    discount = 0
    if discount_percent < 20:
       return price
    else:
       discount += ((price * discount_percent) / 100)

    final_price = price - discount
    return final_price
price = int(input('Enter your original price '))
discount_percent = int(input('Enter your percentage discount '))
print(calc_disc(price, discount_percent))