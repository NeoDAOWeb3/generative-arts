basses = "?/Basses"
horns = "?/horns"
flutes = "?/Flutes"


#produce values from them between 0 and 2 for amps
low_amps = [0, 0.1, 0.2, 0.4, 0.6, 0.8]
high_amps = [1, 1.2, 1.4, 1.6, 1.8, 2]

#define a random high and low amper value
a_low_amp = low_amps.shuffle.first
a_high_amp = high_amps.shuffle.first


# get data for member stats, a snapshot of each weeks to the future.
# current people: 52, bots: 10, total: 62
number_of_people = [5,8,10,14,20,22,25,28,35,40,42,44,50,52]
number_of_bots =   [1,1,2,  1,3, 4, 4, 5, 6, 6, 8, 9, 10,10]
number_of_total_members = [6,9,12,15,23,26,29,33, 41,46,50,53, 60,62]


# define a random sleep time based on weekly interaction with server
a_sleep_time_by_people = (number_of_people.shuffle.first)/8
a_sleep_time_by_bots = (number_of_bots.shuffle.first)/12
a_sleep_time_by_all = (number_of_total_members.shuffle.first)/6


live_loop :intro_bass do
  sample basses, "basses-piz-rr1-a1", amp: 2
  sleep a_sleep_time_by_people
  sample basses, "basses-piz-rr1-a2", amp: a_high_amp
  sleep a_sleep_time_by_bots
  sample basses, "basses-piz-rr1-a2", amp: 1
  sleep a_sleep_time_by_all
  sample basses, "basses-piz-rr1-a1", amp: a_low_amp
  sleep 0.8
  
  sample basses, "basses-piz-rr1-a2", amp: a_low_amp
  
end

live_loop :fluitey do
  sleep 6
  sync :intro_bass
  sample flutes, "flutes-stc-rr1-a4", amp: a_low_amp
  sleep a_sleep_time_by_bots * 3
  sample flutes, "flutes-stc-rr1-a4", amp: 3.6
  sleep a_sleep_time_by_people
  
  sample flutes, "flutes-stc-rr1-a4", amp: 3.6
  sleep a_sleep_time_by_all
end



live_loop :crunchy do
  sleep 12
  sync :intro_bass
  sample horns, "horn-e2", amp: a_high_amp
  sleep 2
  sample horns, "horn-g2", amp: a_high_amp
  sleep 1
end
