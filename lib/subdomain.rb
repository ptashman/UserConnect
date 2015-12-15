class Subdomain
  def self.matches?(request)
    case request.subdomain
    when 'www', '', nil, 'evening-bastion-6313'
      false
    else
      true
    end
  end
end
