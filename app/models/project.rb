class Project < ActiveRecord::Base

    belongs_to :user


    validates :title,
    presence: true

    validates :description,
    presence: true

    validates :time_estimate,
    numericality: { only_integer: true }

    validates :time_start,
    presence: true


    validates :time_end,
    presence: true


    validates :reward_monetary,
    presence: true


    validates :reward_non_monetary,
    presence: true


    validate :time_end_is_in_the_future

    protected

    def time_end_is_in_the_future
        if time_end.present?
            errors.add(:time_end, "should probably be in the future") if time_end < Date.today
        end
    end

end
