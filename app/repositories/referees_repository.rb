class RefereesRepository
  def create(referee_attrs)
    Referee.create(referee_attrs)
  end

  def update(referee_attrs)
    Referee.update(referee_attrs)
  end
end
