class EditionsRepository
  def apply(attrs)
    EditionApply.create(attrs)
  end

  def update(id, attrs)
    apply = EditionApply.find(id)
    apply.update(attrs)
  end
end
