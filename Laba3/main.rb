na = [12]
n = na[0]

ba = [3, 6, 11, 5, 6, 7, 6, 5]
al = [10, 6, 9, 5, 6, 9, 5]

tasks = [
  {
    title: "1. Загальний список та загальна кількість замовлень",
    action: -> {
      total = (ba + al).size
      "Загальна кількість замовлень: #{total}"
    }
  },
  {
    title: "2. Список та кількість унікальних клієнтів",
    action: -> {
      clients = (ba + al).uniq
      "Список клієнтів: #{clients}, Кількість клієнтів: #{clients.size}"
    }
  },
  {
    title: "3. Кількість безалкогольних замовлень",
    action: -> {
      count_non_alcohol = ba.size
      "Кількість безалкогольних замовлень: #{count_non_alcohol}"
    }
  },
  {
    title: "4. Список та кількість клієнтів безалкогольних замовлень",
    action: -> {
      non_alcohol_clients = ba.uniq
      "Список клієнтів: #{non_alcohol_clients}, Кількість: #{non_alcohol_clients.size}"
    }
  },
  {
    title: "5. Кількість алкогольних замовлень",
    action: -> {
      count_alcohol = al.size
      "Кількість алкогольних замовлень: #{count_alcohol}"
    }
  },
  {
    title: "6. Список та кількість клієнтів алкогольних замовлень",
    action: -> {
      alcohol_clients = al.uniq
      "Список клієнтів: #{alcohol_clients}, Кількість: #{alcohol_clients.size}"
    }
  },
  {
    title: "7. Список та кількість клієнтів, що робили обидва типи замовлень",
    action: -> {
      both_types_clients = ba.uniq & al.uniq
      "Список клієнтів: #{both_types_clients}, Кількість: #{both_types_clients.size}"
    }
  },
  {
    title: "8. Список та кількість постійних клієнтів, що сьогодні не відвідували кафе",
    action: -> {
      today_clients = (ba + al).uniq
      all_clients = (1..n).to_a
      no_visit_clients = all_clients - today_clients
      "Список клієнтів: #{no_visit_clients}, Кількість: #{no_visit_clients.size}"
    }
  }
]

tasks.each do |task|
  puts "=== #{task[:title]} ==="
  puts task[:action].call
  puts
end
