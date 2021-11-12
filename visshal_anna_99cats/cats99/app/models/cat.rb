require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = %w(white red blue black cream cinnamon fawn and brown).freeze

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: %w(M F)
    validates :color, inclusion: COLORS

    def age
        time_ago_in_words(birth_date)
    end


end