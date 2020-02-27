#   Бивалютный калькулятор портфеля USD/RUB
#   В случае если новый курс USD нарушает бивалютный портфель то меняем ту валюту которой сейчас меньше
#   по текущему курсу USD к другой валюте пары USD/RUB
puts "Введите Курс доллара: (разделитель для центов . например 65.32)"
usd_rate = gets.chomp.to_f
puts "Введите сколько у вас рублей: (разделитель для копеек . например 6500.87)"
rub_sum = gets.chomp.to_f
puts  "Введите сколько у вас долларов: (разделитель для центов . например 92.35)"
usd_sum = gets.chomp.to_f
rub_from_usd = usd_sum * usd_rate # присвоим переменной сумму рублей по новому курсу USD
biwallet_diff = ((rub_sum - rub_from_usd) / 2).abs # присвоем переменной значение абсолютной разницы активов по новому курсу USD
# 1) Обмен не нужен если (rub_from_usd) равен имеющейся сумме в рублях из переменной rub_sum
# 2) Нельзя поменять пол цента или пол копейки
if biwallet_diff < 0.01  || rub_from_usd == rub_sum # 2 Условия когда обмен невозможен
  puts "Ничего менять не нужно!"
elsif rub_sum > rub_from_usd #   Докупаем разницу долларов за рубли
  puts "Продайте " + biwallet_diff.round(2).to_s + " чтобы купить $ " + (biwallet_diff / usd_rate).round(2).to_s
else usd_sum < rub_from_usd  #   Докупаем разницу в рублях за доллары
  puts "Продайте $ " + (biwallet_diff / usd_rate).round(2).to_s  + " чтобы купить " + biwallet_diff.round(2).to_s + " RUB"
end
