def book_cost(pages, tirages)
  # Редакційні витрати
  autor_fee = 24.0 * pages
  registration_fee = autor_fee * 0.3
  typographic_set = 1.2 * pages

  # Типографічні витрати
  paper = 0.16 * pages + 3
  ink = 0.04 * pages
  depreciation = 0.08 * pages

  # всі редакційні витрати разом
  editorial_total = autor_fee + registration_fee + typographic_set
  editorial_per_book = editorial_total / tirages

  # Типографічні витрати на один екземпляр книги
  printing_per_book = paper + ink + depreciation

  # Собівартість
  cost_per_book = editorial_per_book + printing_per_book

  # Прибуток видавництва (на весь тираж)
  total_profit = cost_per_book * tirages * 0.23

  # Податок на один екземпляр
  tax_per_book = (cost_per_book + total_profit / tirages) * 0.3

  # Загальна вартість
  total_price_per_book = cost_per_book + total_profit / tirages + tax_per_book

  puts "Авторський гонорар: #{autor_fee.round(2)} грн"
  puts "Собівартість книги: #{cost_per_book.round(2)} грн"
  puts "Прибуток видавництва від всього тиражу: #{total_profit.round(2)} грн"
  puts "Податок на один екземпляр: #{tax_per_book.round(2)} грн"
  puts "Загальна вартість одного екземпляру: #{total_price_per_book.round(2)} грн"
end

print "Введіть кількість сторінок: "
pages = gets.chomp.to_i
print "Введіть тираж (кількість примірників): "
tirages = gets.chomp.to_i

book_cost(pages, tirages)
