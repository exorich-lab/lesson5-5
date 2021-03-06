#   Бивалютный калькулятор портфеля USD/RUB
#   В случае если новый курс USD нарушает бивалютный портфель то меняем ту валюту которой сейчас меньше
#   по текущему курсу USD к другой валюте пары USD/RUB
puts "Введите Курс доллара: (разделитель для центов . например 65.32)"
usd_rate = gets.to_f
puts "Введите сколько у вас рублей: (разделитель для копеек . например 6500.87)"
rub_sum = gets.to_f
puts  "Введите сколько у вас долларов: (разделитель для центов . например 92.35)"
usd_sum = gets.to_f
# присвоим переменной сумму рублей по новому курсу USD
rub_from_usd = usd_sum * usd_rate
# присвоем переменной значение абсолютной разницы активов по новому курсу USD
biwallet_diff = ((rub_sum - rub_from_usd) / 2).abs
# 1) Обмен не нужен если (rub_from_usd) равен имеющейся сумме в рублях из переменной rub_sum
# 2) Нельзя поменять пол цента или пол копейки
# # 2 Условия когда обмен невозможен
if biwallet_diff < 0.01
  puts "Ничего менять не нужно!"
  #   Докупаем разницу долларов за рубли
elsif rub_sum > rub_from_usd
  puts "Продайте " + biwallet_diff.round(2).to_s + " RUB, чтобы купить $ " + (biwallet_diff / usd_rate).round(2).to_s
  #   Докупаем разницу в рублях за доллары
else usd_sum < rub_from_usd
  puts "Продайте $ " + (biwallet_diff / usd_rate).round(2).to_s  + " чтобы купить " + biwallet_diff.round(2).to_s + " RUB"
end
