

class Mark
  attr_reader :subject, :value

  def initialize(subject, value)
    @subject = subject
    @value = value
  end

  def to_s
    "#{@subject} : #{@value}"
  end
end

class Student
  attr_reader :marks, :name

  def initialize(name)
    @name = name
    @marks = []
  end

  def exists?(subject_title)
    @marks.any? { |m| m.subject == subject_title }
  end

  def add_mark(mark)
    unless exists?(mark.subject)
      @marks << mark
    end
  end

  def to_s
    "#{@name}, marks: [#{marks.map(&:to_s).join(', ')}]"
  end
end


class RetakeStudent < Student
  def add_mark(mark)
    if exists?(mark.subject)
      @marks.map! { |m| m.subject == mark.subject ? mark : m }
    else
      @marks << mark
    end
  end
end



class Pizza
  attr_reader :ingredients, :d, :number

  @@count = 0
  @@fail_count = 0

  def initialize(d, ingredients)
    if [25, 50].include?(d)
      @@count += 1
      @number = @@count
      @d = d
      @ingredients = ingredients
    else
      @@fail_count += 1
      @number = 0
      @d = 0
      @ingredients = []
    end
  end

  def self.failInstance
    @@fail_count
  end

  def to_s
    "Pizza ##{@number}, d=#{@d}, ingredients: #{@ingredients.join(', ')}"
  end
end

# ----------------------
# Task 4: Author та Book
# ----------------------

class Author
  attr_reader :surname, :name, :patronymic

  @@authors = []

  def self.authors
    @@authors
  end

  def initialize(surname, name, patronymic = nil)
    if valid?(surname) && valid?(name) && (patronymic.nil? || valid?(patronymic))
      @surname = surname
      @name = name
      @patronymic = patronymic
      @@authors << self unless @@authors.any? { |a| a.to_s == self.to_s }
    else
      @surname = @name = @patronymic = nil
    end
  end

  def valid?(str)
    str.is_a?(String) && str.match?(/\A[\p{L}-]{1,15}\z/)
  end

  def to_s
    [@surname, @name, @patronymic].compact.join(' ')
  end
end

class Book
  attr_reader :authors, :title, :publisher, :year

  def initialize(authors, title, publisher, year)
    if valid_authors?(authors) && valid_title?(title) &&
       valid_title?(publisher) && valid_year?(year)
      @authors = authors
      @title = title
      @publisher = publisher
      @year = year
    else
      @authors =
        @title =
          @publisher =
            @year = nil
    end
  end

  def valid_authors?(authors)
    authors.all? { |a| a.is_a?(Author) } &&
      authors.map(&:to_s).uniq.size == authors.size
  end

  def valid_title?(str)
    str.is_a?(String) && str.match?(/\A[\p{L}\d\-\.,;]{1,50}\z/)
  end

  def valid_year?(year)
    year.to_s.match?(/\A\d{4}\z/) && year.to_i <= Time.now.year
  end

  def to_s
    if authors.nil?
      "Invalid book"
    else
      "Book: '#{@title}', publisher: #{@publisher}, year: #{@year}, authors: [#{authors.map(&:to_s).join('; ')}]"
    end
  end
end



puts "=== Task 1 ==="
mark = Mark.new('C++', 5)
puts mark
st = Student.new('First student')
st.add_mark(mark)
puts st
mark2 = Mark.new('C++', 3)
st.add_mark(mark2)
puts st

puts "\n=== Task 2 ==="
mark = Mark.new('C++', 5)
mark2 = Mark.new('C++', 3)
ret = RetakeStudent.new('Other student')
ret.add_mark(mark)
ret.add_mark(mark2)
puts ret

puts "\n=== Task 3 ==="
pizza1 = Pizza.new(10, ['mushroom', 'cheese'])
pizza2 = Pizza.new(25, ['mushroom', 'cheese', 'cherry'])
pizza3 = Pizza.new(50, ['mushroom'])
pizza4 = Pizza.new(100, ['mushroom', 'cheese', 'cherry'])
puts pizza1
puts pizza2
puts pizza3
puts pizza4
puts "Fail instances: #{Pizza.failInstance}"

puts "\n=== Task 4 ==="
a1 = Author.new('Shevchenko', 'Taras')
a2 = Author.new('Franko', 'Ivan')
book = Book.new([a1, a2], 'Kobzar', 'Kyiv-Print', 2020)
puts book
