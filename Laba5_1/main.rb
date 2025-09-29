
# ------------------------------
# 1. Ідентифікатори типів (int, char, float, double) → UPCASE
def upcase_type_keywords(lines)
  lines.map do |ln|
    ln.gsub(/\b(?:int|char|float|double)\b/i) { |m| m.upcase }
  end
end

# ------------------------------
# 2. Директиви препроцесора: '#' → '_', прописні символи → UPCASE
def transform_preprocessor_directives(lines)
  lines.map do |ln|
    if ln =~ /^\s*#/
      ln.sub(/^(\s*)#/, '\1_').upcase
    else
      ln
    end
  end
end

# ------------------------------
# 3. Ключові слова циклів (while, do, for) → UPCASE
def upcase_loop_keywords(lines)
  lines.map do |ln|
    ln.gsub(/\b(?:while|do|for)\b/i) { |m| m.upcase }
  end
end

# ------------------------------
# 4. Числові константи → decimal, octagonal, hexagonal
def replace_integer_constants(lines)
  pattern = /\b(?:0[xX][0-9a-fA-F]+|0[0-7]*|[1-9][0-9]*)\b/
  lines.map do |ln|
    ln.gsub(pattern) do |num|
      if num =~ /^0[xX]/
        "hexagonal"
      elsif num =~ /^0/
        "octagonal"
      else
        "decimal"
      end
    end
  end
end

# ------------------------------
# 5. Аналіз заголовка функції: тип результату та кількість параметрів
def analyze_function_header(lines)
  text = lines.join("\n")
  if text =~ /\b(void|int|char|float|double)\b\s+[A-Za-z_]\w*\s*\(([^)]*)\)/
    return_type = $1.downcase
    params_str = $2.strip

    counts = Hash.new(0)
    standard = %w[void int char float double]

    if params_str.empty? || params_str.strip == "void"
      # Жодних параметрів
    else
      params = params_str.split(",").map(&:strip)
      params.each do |p|
        if p =~ /\b(void|int|char|float|double)\b/i
          t = $1.downcase
          counts[t] += 1
        else
          counts["other"] += 1
        end
      end
    end

    { return_type: return_type, parameter_counts: counts }
  else
    nil
  end
end

# ------------------------------
# 6. Замінити комплексні числа формату "Re +/- i*Im" → complex
def replace_complex_numbers(lines)
  pattern = /
    (?<![\w.])
    ([+-]?\d+(?:\.\d+)?)
    \s*
    ([+-])
    \s*
    i\s*\*\s*
    ([+-]?\d+(?:\.\d+)?)
    (?![\w.])
  /x

  lines.map { |ln| ln.gsub(pattern, 'complex') }
end

if __FILE__ == $0
  code_sample = [
    "#include <stdio.h>",
    "int main() {",
    "    int a = 123;",
    "    Float b = 0x1A3f;",
    "    double c = 0777;",
    "    char d = 'x';",
    "    while(a < 10) { a++; }",
    "    do { a--; } while(a>0);",
    "    for(int i=0;i<5;i++) {}",
    "    double compute(int a, const char* s, float f, long x);",
    "    z = 3 + i*4;",
    "    w = -2.5- i*0.75;",
    "}"
  ]

  puts "--- 1. UPCASE типів ---"
  puts upcase_type_keywords(code_sample)
  puts "\n--- 2. Препроцесор ---"
  puts transform_preprocessor_directives(code_sample)
  puts "\n--- 3. UPCASE ключові слова циклів ---"
  puts upcase_loop_keywords(code_sample)
  puts "\n--- 4. Заміна чисел ---"
  puts replace_integer_constants(code_sample)
  puts "\n--- 5. Аналіз заголовка функції ---"
  p analyze_function_header(code_sample)
  puts "\n--- 6. Замінити комплексні числа ---"
  puts replace_complex_numbers(code_sample)
end
