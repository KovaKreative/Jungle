class Sale < ApplicationRecord

  def self.active
    self.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current)
  end

  # Returns the status of the sale as a string value that will be used in the badge
  def status
    
    if ends_on < Date.current
      return 'Finished'
    end
    
    if starts_on > Date.current
      return 'Upcoming'
    end
    
    'Active'
  
  end

end
