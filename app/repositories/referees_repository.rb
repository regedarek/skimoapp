class RefereesRepository
  def create(referee_attrs)
    Referee.create(referee_attrs)
  end

  def update(id:, attrs:, expiration_date:)
    referee = Referee.find(id)
    referee.update(attrs)
    referee.update(expiration_date: expiration_date)
    referee
  end
end
