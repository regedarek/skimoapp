class EditionsRepository
  def apply(attrs)
    EditionApply.create(attrs)
  end

  def update(id, attrs)
    apply = EditionApply.friendly.find(id)
    apply.update(attrs)
    apply
  end
end
