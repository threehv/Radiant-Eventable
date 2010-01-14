module ToSExtension
  def to_s
    return name if self.respond_to?(:name)
    return title if self.respond_to?(:title)
  end
end