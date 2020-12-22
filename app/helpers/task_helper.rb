module TaskHelper
  def todo(tasks)
    tasks.where(status: 0)
  end

  def done(tasks)
    tasks.where(status: 1)
  end

  def cancelled(tasks)
    tasks.where(status: 2)
  end
end
