puts "Введіть текстовий рядок:"
text = gets.chomp

words = text.split(" ")

tasks = [
  {
    title: "1. Введений текст",
    action: -> {
      "Ви ввели: #{text}"
    }
  },
  {
    title: "2. Розмір рядка",
    action: -> {
      "Розмір рядка: #{text.size}"
    }
  },
  {
    title: "3. Підрахунок символів",
    action: -> {
      uppercase_count = text.count("A-Z")
      lowercase_count = text.count("a-z")
      digit_count     = text.count("0-9")
      "Кількість великих букв: #{uppercase_count}, " \
        "кількість малих букв: #{lowercase_count}, " \
        "кількість цифр: #{digit_count}"
    }
  },
  {
    title: "4. Масив слів",
    action: -> {
      "Масив слів: #{words}"
    }
  },
  {
    title: "5. Слова, впорядковані за зростанням довжини",
    action: -> {
      sorted_words = words.sort_by { |w| w.length }
      "Слова: #{sorted_words}"
    }
  },
  {
    title: "6. Слова з великої літери",
    action: -> {
      capitalized_words = words.map { |w| w.capitalize }
      "Слова: #{capitalized_words}"
    }
  },
  {
    title: "7. Підозрілі слова (містять і букви, і цифри)",
    action: -> {
      suspicious_words = words.select { |w| w.match?(/[A-Za-z]/) && w.match?(/\d/) }
      if suspicious_words.empty?
        "Підозрілих слів немає."
      else
        "Підозрілі слова: #{suspicious_words}"
      end
    }
  },
  {
    title: "8. Новий текст у порядку спадання довжини",
    action: -> {
      desc_sorted_words = words.sort_by { |w| -w.length }
      "Новий текст: #{desc_sorted_words.join(" ")}"
    }
  }
]

tasks.each do |task|
  puts "=== #{task[:title]} ==="
  puts task[:action].call
  puts
end
