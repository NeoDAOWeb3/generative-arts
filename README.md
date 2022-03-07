# generative-arts
Generative arts, feeded with community data.

Currently `code/number_of_members.rb` is generating an audio file, using Discord stats such as number of people, bots and total;

and generating a randomness by shuffling an array; composed of values per week of that stat. 

Those values are used on sleep time and picking low/high amps.

to run on sonic-pi, you need these these samples or replace with others; however don't forget to change where they are defined and referenced in the code. 

eg: 
first define an instrument on top of the .ruby file:
`flutes = "?/Flutes"`

then call it in the loop like this:
`sample flutes ...` 

```
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
```

made with
https://sonic-pi.net
https://github.com/peastman/sso




