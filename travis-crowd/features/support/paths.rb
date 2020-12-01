module Paths
  def path_to(name)
    case name
    when 'the home page'
      root_path
    when 'my profile page'
      profile_path
    when 'the order page for the "Medium" package'
      new_package_path(package: :medium)
    when 'the order page for the "Medium" subscription'
      new_subscription_path(package: :medium)
    else
      raise "Could not find path to: #{name}"
    end
  end
end

World(Paths)
