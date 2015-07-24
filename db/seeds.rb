# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
puts "Seeding: Macro Cycles"
Macro.delete_all
#
Macro.create(:name => 'Maraton Bs.As. Octubre 2015',
                  :notes => 'Plan para maraton de grupo A',
                  :startDate => Date.today,
                  :endDate => Date.today + 4.months,
                  :volume => 350 )
Macro.create(:name => 'Media Maraton Bs.As. Setiembre 2015',
                  :notes => 'Plan para media maraton de grupo 2',
                  :startDate => Date.today,
                  :endDate => Date.today + 3.months,
                  :volume => 280 )
                  
                  
puts "Seeding: Cycles"
Cycle.delete_all
#
start_date = Chronic.parse("next Monday")
end_date = start_date + 4.months
maraton = Cycle.create(
            :name => "Maraton Bs.As. Octubre 2015",
            :notes => "Plan para maraton de grupo A",
            :start_date => start_date,
            :end_date => end_date,
            :volume => 360,
            :parent => nil)
4.times do |m|
    start_date = maraton.start_date  + (m * 4).weeks
    end_date = start_date + 4.weeks - 1 
    month =  start_date.strftime("%B")
    meso = maraton.children.create(
            :name => "Meso #{m}",
            :notes => "Month #{month}",
            :start_date => start_date,
            :end_date => end_date,
            :volume => 90)
    4.times do |w|
      start_date = meso.start_date  + (w * 7).days
      end_date = start_date + 6.days 
      week =  start_date.strftime("%W")
      micro = meso.children.create(
              :name => "Micro #{m}.#{w}",
              :notes => "Week #{week}",
              :start_date => start_date,
              :end_date => end_date,
              :volume => 22)
      7.times do |d|
        start_date = micro.start_date + d.days
        day = start_date.strftime("%A") 
        case start_date.wday
        when 0
          volume = 0
        when 1
          volume = 7
        when 2
          volume = 0
        when 3
          volume = 6
        when 4
          volume = 0
        when 5
          volume = 0
        when 6
          volume = 9
        end       
        mano = micro.children.create(
                :name => "Day #{m}.#{w}.#{d}",
                :notes => day,
                :start_date => start_date,
                :end_date => start_date,
                :volume => volume)
        
      end
    end
    
end

