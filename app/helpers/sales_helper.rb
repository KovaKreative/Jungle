module SalesHelper

  def active_sale
    Sale.first
  end

  # Determine the colour of the badge based on the status
  def status_colour status
    case status
    when "Active"
      return "bg-success"
    when "Upcoming"
      return "bg-info"
    when "Finished"
      return "bg-secondary"
    else
      return "bg-primary"
    end
  end

end