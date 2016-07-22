class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

private

  define_method(:capitalize_name) do
    check_words = ["a","an","the","and","but","or","for","nor", "aboard",
"about","above","across","after","against","along","amid","among","around",
"as","at","atop","before","behind","below","beneath","beside","between","beyond","by","despite","down","during","for","from","in","inside","into","like","near","of","off","on","onto","out","outside","over","past","regarding","round","since","than","through","throughout","till","to","toward","under","unlike","until","up","upon","with","within","without"]
    string_array = self.name.split
    string_array.each do |string|
      string.downcase!()
      if !check_words.include?(string)
        string.capitalize!
      end
    end
    string_array.at(0).capitalize!()
    self.name=(string_array.join(" "))
  end
end
