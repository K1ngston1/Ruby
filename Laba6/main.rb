
def aggregate_goods(array)
  result = {}

  array.each do |item|
    name, count = item.split("-")
    key = name.to_sym
    result[key] = result.fetch(key, 0) + count.to_i
  end

  result
end

def classify_students(data, max, upper_bound, lower_bound)
  students = data.split.map do |entry|
    name, score = entry.split(",")
    [name, score.to_i]
  end

  students.sort_by! { |name, score| [-score, name] }

  top_threshold = max - upper_bound
  middle_threshold = max - lower_bound

  result = { top: [], middle: [], bottom: [] }

  students.each do |name, score|
    if score >= top_threshold
      result[:top] << name
    elsif score >= middle_threshold
      result[:middle] << name
    else
      result[:bottom] << name
    end
  end

  result
end


if __FILE__ == $0
  array = ["Milk-10", "Milk-20", "Sugar-10"]
  goods_result = aggregate_goods(array)
  puts "Goods aggregation result:"
  puts goods_result
  puts

  data = "Student1,70 Student3,80 Student2,80"
  max = 100
  upper_bound = 10
  lower_bound = 15

  students_result = classify_students(data, max, upper_bound, lower_bound)
  puts "Students classification result:"
  puts students_result
end
