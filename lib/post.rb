class Post
  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console
  end
  def to_s
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    # strings = [@text]
    to_s.each do |item|
      file.puts(item)
    end

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)
    file_name = @created_at.strftime("#{self.class.name} %Y-%m-%d_%H-%M-%S.txt")
    "#{current_path}/#{file_name}"
  end
end
