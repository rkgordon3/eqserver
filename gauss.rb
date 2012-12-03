def gaussian_rand
  u1 = u2 = w = g1 = g2 = 0  # declare
  begin
    u1 = 2 * rand - 1
    u2 = 2 * rand - 1
    w = u1 * u1 + u2 * u2
  end while w >= 1
 
  w = Math::sqrt( ( -2 * Math::log(w)) / w )
  g2 = u1 * w;
  g1 = u2 * w;
end
