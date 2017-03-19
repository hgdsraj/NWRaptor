module TripMatchesHelper

  def distance(a,b)
    r = 6371e3
    phi_1 = radians(a.latitude)
    delta_phi_2 = radians(b.latitude)
    delta_phi = radians(b.latitude-a.latitude)
    delta_lamda = radians(b.longitude-a.longitude  )

    a = Math.sin(delta_phi/2) * Math.sin(delta_phi/2) +
        Math.cos(phi_1) * Math.cos(delta_phi_2) *
            Math.sin(delta_lamda/2) * Math.sin(delta_lamda/2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    r * c

  end

  def radians(a)
    a * Math::PI / 180
  end
end
