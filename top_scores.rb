def sort_me(scores, highest)
  tabs = highest.downto(0).zip([0] * (highest + 1)).to_h

  scores.each do |s|
    tabs[s] += 1
  end

  tabs.flat_map do |k, v|
    [k] * v
  end

end


puts sort_me([45, 36, 56, 86, 34, 17, 89], 100)
