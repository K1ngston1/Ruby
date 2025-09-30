
def sum
  values = [4, 0, -12]
  total = 0
  values.each do |v|
    total += yield(v)
  end
  total
end

resul1t = sum do |x|
  if x < 0
    x * x
  else
    x
  end
end

puts "=== Task 1 ==="
puts "Result Task 1: #{resul1t}"


def check_password(user, pass)
  proc do |u, p|
    u == user && p == pass
  end
end

puts "\n=== Task 2 ==="
print "Введіть логін: "
input_user = gets.chomp
print "Введіть пароль: "
input_pass = gets.chomp

admin = check_password("u1", "p1")
if admin.call(input_user, input_pass)
  puts "Доступ дозволено ✅"
else
  puts "Невірний логін або пароль ❌"
end
