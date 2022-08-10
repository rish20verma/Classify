# frozen_string_literal: true
require_relative "classify/version"
require 'time'
require 'pry'

class Classify::Classify
  attr_reader :imei, :expiry

  def initialize(imei, expiry)
    @imei = imei
    @expiry = expiry
  end

  def fraudulent?
    if check_details
      'Good'
    else
      'Bad'
    end
  end

  private

  def check_details
    check_expiry && check_imei
  end

  def check_imei
    tmp = @imei
    nDigits = tmp.length
    sum = 0
    parity = (nDigits-2) % 2
    0.upto(nDigits -1) do |i|
        digit = tmp[i].to_i
        if i % 2 == parity
            digit = digit * 2
        end
        if digit > 9
            digit = digit - 9
        end
        sum = sum + digit
    end
    ((sum % 10) == 0)
  end

  def check_expiry
    m_y = @expiry.split('/')
    return false unless m_y.length == 2
    formatted_expiry = Time.parse(m_y[1] + '/' + m_y[0] + '/01')
    split = @expiry.split('/')
    formatted = Time.parse(split[1] + '/' + split[0] + '/01')
    formatted == formatted_expiry
  end
end
