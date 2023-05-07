class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.avg_age
    average(:age)
  end

  def missions
    missions = AstronautMission.select(:mission_id).where(astronaut_id: id)
    Mission.where(id: missions).order(:title)
  end
end
