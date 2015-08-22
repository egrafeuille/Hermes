# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
                  
# puts "Seeding: Cycles"
# Cycle.delete_all
# #
# start_date = Chronic.parse("next Monday")
# end_date = start_date + 4.months
# maraton = Cycle.create(
            # :name => "Maraton Bs.As. Octubre 2015",
            # :notes => "Plan para maraton de grupo A",
            # :start_date => start_date,
            # :end_date => end_date,
            # :volume => 360,
            # :type => 'Macro', 
            # :parent => nil)
# 4.times do |m|
    # start_date = maraton.start_date  + (m * 4).weeks
    # end_date = start_date + 4.weeks - 1 
    # month =  start_date.strftime("%B")
    # meso = maraton.children.create(
            # :name => "Meso #{m}",
            # :notes => "Month #{month}",
            # :start_date => start_date,
            # :end_date => end_date,
            # :type => 'Meso',
            # :volume => 90)
    # 4.times do |w|
      # start_date = meso.start_date  + (w * 7).days
      # end_date = start_date + 6.days 
      # week =  start_date.strftime("%W")
      # micro = meso.children.create(
              # :name => "Micro #{m}.#{w}",
              # :notes => "Week #{week}",
              # :start_date => start_date,
              # :end_date => end_date,
              # :type => 'Micro',              
              # :volume => 22)
      # 7.times do |d|
        # start_date = micro.start_date + d.days
        # day = start_date.strftime("%A") 
        # case start_date.wday
        # when 0
          # volume = 0
        # when 1
          # volume = 7
        # when 2
          # volume = 0
        # when 3
          # volume = 6
        # when 4
          # volume = 0
        # when 5
          # volume = 0
        # when 6
          # volume = 9
        # end       
        # mano = micro.children.create(
                # :name => "Day #{m}.#{w}.#{d}",
                # :notes => day,
                # :start_date => start_date,
                # :end_date => start_date,
                # :type => 'Nano',
                # :volume => volume)
#         
      # end
    # end
#     
# end

puts "Seeding: Moves"
Move.delete_all
#
start_date = Chronic.parse("next Monday")
end_date = start_date + 4.months
maraton = Move.create(
            :type => 'Macro',
            :name => "Maraton Bs.As. Octubre 2015",
            :notes => "Plan para maraton de grupo A",
            :start_date => start_date,
            :end_date => end_date,
            :distance => 360)
4.times do |m|
    start_date = maraton.start_date  + (m * 4).weeks
    end_date = start_date + 4.weeks - 1 
    month =  start_date.strftime("%B")
    meso = maraton.children.create(
            :type => 'Meso',
            :name => "Meso #{m}",
            :notes => "Month #{month}",
            :start_date => start_date,
            :end_date => end_date,
            :distance => 90)
    4.times do |w|
      start_date = meso.start_date  + (w * 7).days
      end_date = start_date + 6.days 
      week =  start_date.strftime("%W")
      micro = meso.children.create(
              :type => 'Micro',
              :name => "Micro #{m}.#{w}",
              :notes => "Week #{week}",
              :start_date => start_date,
              :end_date => end_date,
              :distance => 22)
      7.times do |d|
        start_date = micro.start_date + d.days
        day = start_date.strftime("%A") 
        distance = case start_date.wday
          when 0, 2, 4, 5
            0
          when 1
            7
          when 3
            6
          when 6
            9
        end     
        nano = micro.children.create(
                :type => 'Nano',
                :name => "Day #{m}.#{w}.#{d}",
                :notes => day,
                :start_date => start_date,
                :end_date => start_date,
                :distance => distance
                )
        if distance > 0
          step1 = nano.steps.create(
                  :name => "Step 1",
                  :notes => "Warming Up",
                  :times => 1,
                  :intensity => 70,
                  :duration => Chronic.parse("10 minutes")
                  )
          step2 = nano.steps.create(
                  :name => "Step 2",
                  :notes => "Main",
                  :times => 6,
                  :intensity => 100,
                  :distance => 1.5
                  )                
          step3 = nano.steps.create(
                  :name => "Step 3",
                  :notes => "Calm Down",
                  :times => 1,
                  :intensity => 70,
                  :duration => Chronic.parse("15 minutes")
                  )
        end
      end
    end
end

