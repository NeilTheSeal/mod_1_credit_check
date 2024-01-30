#!/usr/bin/env ruby

require 'optparse'

class CreditCard
    attr_reader :card_number, :limit

    def initialize(card_number, limit)
        @card_number = card_number
        @limit = limit
    end

    def is_valid?
        i = 0
        summed = 0
        while i < @card_number.length
            num = @card_number[i].to_i
            if i % 2 == 0
                doubled = num * 2
                if doubled > 9
                    digits = doubled.to_s
                    summed += digits[0].to_i + digits[1].to_i
                else
                    summed += num
                end
            else
                summed += num
            end
            i = i + 1
        end
        if summed % 10 == 0
            return true
        else
            return false
        end
    end

    def last_four
        four_digit_str = ""
        for i in -4..-1
            four_digit_str.concat(@card_number[i])
        end
        four_digit_str
    end
end

options = {}
OptionParser.new do |op|
    op.on("-n", "--validcc", "Check valid credit card number") do |value|
        options[:name] = value
    end
end.parse!
if options[:name] != nil
    cc = CreditCard.new(options[:name].to_s, 0)
    puts cc.is_valid?
end