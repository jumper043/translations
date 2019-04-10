module PostsHelper
  def tags_name
    Tag.counts.each do |tag|
      yield(tag)
    end
  end
end
