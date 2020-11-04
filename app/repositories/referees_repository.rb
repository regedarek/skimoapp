class RefereesRepository
  def create(referee_attrs)
    Referee.create(referee_attrs)
  end

  def update(id:, attrs:)
    Referee.find(id).update(attrs)
  end
end
