# Rake task to populate development database with test data
# Run it with "rake db:populate"

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    # REQUIRE THE FAKER GEM TO GENERATE FAKE CONTENT

    require 'faker'

    #RESET THE DATABASE BEFORE POPULATING DATA

    Rake::Task['db:reset'].invoke

    #SET UP THE MAIN ADMIN USER PROFILE FOR THE SITE

    user = User.create!(:email => '1@1.com',
      :password => "password")

    profile = Profile.create(:user_id => user.id,
                            :first_name => Faker::Name.first_name,
                            :last_name => Faker::Name.last_name,
                            :primary_discipline => ['Drums', 'Guitar', 'Bass', 'Piano', 'Vocal', 'Synth', 'Production', 'DJ', 'Keys'].sample,
                            :profile_name => Faker::Name.name,
                            :youtube_url => 'youtube.com',
                            :soundcloud_url => 'soundcloud.com',
                            :linkedin_url => 'linked_in.com',
                            :profile_image => '/images/icons/youtube_icon.png',
                            :profile_video => 'youtube.com',
                            :genres => ['rock', 'pop', 'folk', 'acoustic', 'emo', 'dubstep', 'metal', 'progressive', 'jazz', 'rap', 'hip-hop', 'RnB', 'techno', 'funk', 'disco', 'dance'].sample,
                            :infleunces => ['The Beatles', 'The Rolling Stones', 'David Bowie', 'The Gorillaz', 'The Killers', 'Katy Perry', 'Blondie', 'Elton John', 'Lady Gaga', 'Amy Winehouse', 'Mark Ronson' ].sample,
                            :role => 'registered')
    
    # GENERATE 5 PROJECTS FOR THE ADMIN USER PROFILE

    5.times do |c|

          project = Project.create!(:title => Faker::Hacker.ingverb,
                            :bpm => (rand(25-1) + 1) + ((rand(9-1) + 1) *0.1),
                            :description => Faker::Lorem.paragraph(sentence_count = 3),
                            :user_id => user.id,
                            :key => ['C Major', 'C Minor', 'Other', 'D Major', 'D Minor'].sample,
                            :public => [true, false].sample,
                            :editable => [true, false].sample,
                            :published => [true, false].sample,
                            :preview_url => ['http://thiswillbetheproviewurl.com', 'http://anotherpreviewurl.com'].sample)

          membership = Membership.new(:user_id => user.id,
                                :project_id => project.id)
          project.memberships << membership
      
    end


    #GENERATE 100 RANDOM PROFILES WIRTH 5 PROJECTS EACH


      100.times do |c|
     
           user = User.create!(:email => Faker::Internet.email,
                               :password => "password")

          profile = Profile.create(:user_id => user.id,
                                :first_name => Faker::Name.first_name,
                                :last_name => Faker::Name.last_name,
                                :primary_discipline => ['Drums', 'Guitar', 'Bass', 'Piano', 'Vocal', 'Synth', 'Production', 'DJ', 'Keys'].sample,
                                :profile_name => Faker::Name.name,
                                :youtube_url => 'youtube.com',
                                :soundcloud_url => 'soundcloud.com',
                                :linkedin_url => 'linked_in.com',
                                :profile_image => '/images/icons/youtube_icon.png',
                                :profile_video => 'youtube.com',
                                :genres => ['rock', 'pop', 'folk', 'acoustic', 'emo', 'dubstep', 'metal', 'progressive', 'jazz', 'rap', 'hip-hop', 'RnB', 'techno', 'funk', 'disco', 'dance'].sample,
                                :infleunces => ['The Beatles', 'The Rolling Stones', 'David Bowie', 'The Gorillaz', 'The Killers', 'Katy Perry', 'Blondie', 'Elton John', 'Lady Gaga', 'Amy Winehouse', 'Mark Ronson' ].sample,
                                :role => 'registered')
    
    # CGENERATE 5 PROJECTS FOR EACH RANDOM PROFILE
      5.times do |c|

        project = Project.create!(:title => Faker::Hacker.ingverb,
                                  :bpm => (rand(25-1) + 1) + ((rand(9-1) + 1) *0.1),
                                  :description => Faker::Lorem.paragraph(sentence_count = 3),
                                  :key => ['C Major', 'C Minor', 'Other', 'D Major', 'D Minor'].sample,
                                  :public => [true, false].sample,
                                  :editable => [true, false].sample,
                                  :published => [true, false].sample,
                                  :preview_url => ['http://thiswillbetheproviewurl.com', 'http://anotherpreviewurl.com'].sample)



        membership = Membership.new(:user_id => user.id,
                                :project_id => project.id)
        project.memberships << membership
  
      end
    end

    

    500.times do |c|
      user = User.all.sample
      friendship = Friendship.new(:user_id =>  user.id ,
                                  :friend_id => User.all.sample.id,
                                  :state => "accepted")
      user.friendships << friendship


    end

  



  end
end

  