class EwmaCalculator
  def initialize
    @factors = [1.33, 0.80, 0.57, 0.44, 0.36, 0.31, 0.27, 0.24, 0.21, 0.19]
  end

  def calc_ewma(history)
    raise "Invalid (zero-length) weighin history" if history.count == 0
    return history[0] if history.count == 1
    factors_subset = @factors[0..(history.count-1)]
    combined = factors_subset.zip(history).collect { |f,v| f*v }
    (combined.inject(:+) / factors_subset.inject(:+)).round(1)
  end
end
