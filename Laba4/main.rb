na = [12]
n = na[0]

# Замовлення клієнтів
ba = [3, 6, 11, 5, 6, 7, 6, 5]   # безалкогольні
al = [10, 6, 9, 5, 6, 9, 5]      # алкогольні

# ----------------------------------------------------
# 1. Загальний список та загальна кількість замовлень
# ----------------------------------------------------
all_orders = []
ba.each { |id| all_orders << id }
al.each { |id| all_orders << id }

puts "1. Загальний список замовлень: #{all_orders}"
puts "   Загальна кількість замовлень: #{all_orders.length}"
puts

# ----------------------------------------------------
# 2. Список та кількість унікальних клієнтів
# ----------------------------------------------------
clients = []
all_orders.each do |id|
  clients << id unless clients.include?(id)
end

puts "2. Список клієнтів: #{clients}"
puts "   Кількість клієнтів: #{clients.length}"
puts

# ----------------------------------------------------
# 3. Кількість безалкогольних замовлень
# ----------------------------------------------------
count_non_alcohol = 0
ba.each { |_| count_non_alcohol += 1 }

puts "3. Кількість безалкогольних замовлень: #{count_non_alcohol}"
puts

# ----------------------------------------------------
# 4. Список та кількість клієнтів безалкогольних замовлень
# ----------------------------------------------------
non_alcohol_clients = []
ba.each do |id|
  non_alcohol_clients << id unless non_alcohol_clients.include?(id)
end

puts "4. Список клієнтів безалкогольних замовлень: #{non_alcohol_clients}"
puts "   Кількість: #{non_alcohol_clients.length}"
puts

# ----------------------------------------------------
# 5. Кількість алкогольних замовлень
# ----------------------------------------------------
count_alcohol = 0
al.each { |_| count_alcohol += 1 }

puts "5. Кількість алкогольних замовлень: #{count_alcohol}"
puts

# ----------------------------------------------------
# 6. Список та кількість клієнтів алкогольних замовлень
# ----------------------------------------------------
alcohol_clients = []
al.each do |id|
  alcohol_clients << id unless alcohol_clients.include?(id)
end

puts "6. Список клієнтів алкогольних замовлень: #{alcohol_clients}"
puts "   Кількість: #{alcohol_clients.length}"
puts

# ----------------------------------------------------
# 7. Список та кількість клієнтів, що робили обидва типи замовлень
# ----------------------------------------------------
both_types_clients = []
non_alcohol_clients.each do |id|
  both_types_clients << id if alcohol_clients.include?(id)
end

puts "7. Список клієнтів, що робили обидва типи: #{both_types_clients}"
puts "   Кількість: #{both_types_clients.length}"
puts

# ----------------------------------------------------
# 8. Список та кількість постійних клієнтів, що сьогодні не відвідували кафе
# ----------------------------------------------------
all_clients = []
for i in 1..n
  all_clients << i
end

no_visit_clients = []
all_clients.each do |id|
  no_visit_clients << id unless clients.include?(id)
end

puts "8. Список постійних клієнтів, що не відвідували: #{no_visit_clients}"
puts "   Кількість: #{no_visit_clients.length}"
