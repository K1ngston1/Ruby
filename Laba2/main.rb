def cost(area, material, floor, district, style, category)
  sv = case material.downcase
       when "панель", "panel"        then area * 300
       when "цегла", "brick"         then area * 500
       when "композит", "composite"  then area * 800
       else
         raise "Невідомий матеріал"
       end
  floor_coeff = if [1, 2].include?(floor) || floor >= 8
                  1.1
                else
                  1.4
                end

  district_coeff = case district.downcase
                   when "центр"      then 1.7
                   when "спальний"   then 1.4
                   when "приміський" then 1.15
                   else
                     raise "Невідомий район"
                   end

  rm = sv * floor_coeff * district_coeff

  # === Прибуток забудовника (case) ===
  arch_coeff = case style.downcase
               when "хайтех"     then 2.0
               when "ексклюзів"  then 1.7
               when "індивідуал" then 1.5
               when "стандарт"   then 1.05
               else
                 raise "Невідомий стиль"
               end

  pz = rm * arch_coeff

  # === Загальна вартість (case) ===
  tax_coeff = case category.downcase
              when "елітна"    then 1.75
              when "бюджетна"  then 1.5
              when "пільгова"  then 1.07
              else
                raise "Невідома категорія"
              end

  zv = pz * tax_coeff

  return sv, pz, zv
end

print "Введіть площу квартири: "
area = gets.to_f
print "Введіть матеріал (панель/цегла/композит): "
material = gets.chomp
print "Введіть поверх: "
floor = gets.to_i
print "Введіть район (центр/спальний/приміський): "
district = gets.chomp
print "Введіть стиль (хайтех/ексклюзів/індивідуал/стандарт): "
style = gets.chomp
print "Введіть категорію (елітна/бюджетна/пільгова): "
category = gets.chomp

sv, pz, zv = cost(area, material, floor, district, style, category)

puts sv > 100_000 ? "Собівартість (СВ): #{sv.round(2)} (висока)" : "Собівартість (СВ): #{sv.round(2)} (нормальна)"
puts "Вартість забудовника (ПЗ): #{pz.round(2)}"
puts "Загальна вартість (ЗВ): #{zv.round(2)}"
