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

    profile = Profile.create!(:user_id => user.id,
                            :first_name => 'Graeme',
                            :last_name => 'Kean',
                            :primary_discipline => 'Drummer',
                            :profile_name => 'The Gen_Rule',
                            :youtube_url => 'https://www.youtube.com/channel/UCKFNAIWotHMt99SrErdP62Q',
                            :soundcloud_url => 'soundcloud.com',
                            :linkedin_url => 'linked_in.com',
                            :profile_image => "images/gang/"+["Chae", "Graeme", "Keano", "Kat", "Keith", "Kieran", "Leigh-Ann", "Michael", "Neil", "Nevin", "Peter", "Sandy", "Tony", "Simon", "Val"].sample+" - "+["dead", "happy", "normal", "sad", "undead"].sample+".jpg",
                            :profile_video => 'https://www.youtube.com/watch?v=kO8x8eoU3L4',
                            :genres => ['rock', 'pop', 'folk', 'acoustic', 'emo', 'dubstep', 'metal', 'progressive', 'jazz', 'rap', 'hip-hop', 'RnB', 'techno', 'funk', 'disco', 'dance'].sample,
                            :influences => ['The Beatles', 'The Rolling Stones', 'David Bowie', 'The Gorillaz', 'The Killers', 'Katy Perry', 'Blondie', 'Elton John', 'Lady Gaga', 'Amy Winehouse', 'Mark Ronson' ].sample,
                            :role => 'registered',
                            :city => ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Stirling'].sample)

    user.profile = profile

    studio = Studio.create!(:user_id => user.id,
                          :status => 'public')
    user.studio = studio
    
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

          stem = Stem.create!(:description => Faker::Lorem.paragraph(sentence_count = 3), 
                          :key => project.key, 
                          :bpm => project.bpm, 
                          :instrument => ['Piano', 'Drums', 'Bass', 'Mix', 'Electric Guitar', 'Acoustic Guitar', 'Keys', 'Vocal', 'Backing Vocal', 'Percussion', 'Pad', 'Other'].sample,
                          :membership_id => membership.id)

          membership.stems << stem
      
    end


    #SET UP THE SECONDARY ADMIN USER PROFILE FOR THE SITE

    user = User.create!(:email => '2@2.com',
      :password => "password")

    profile = Profile.create!(:user_id => user.id,
                            :first_name => 'David',
                            :last_name => "Cunningham",
                            :primary_discipline => 'Guitar',
                            :profile_name => 'Logrey',
                            :youtube_url => 'https://www.youtube.com/channel/UC6Nl1zrmqVpCjdZg8YFU1gQ',
                            :soundcloud_url => 'soundcloud.com',
                            :linkedin_url => 'linked_in.com',
                            #:profile_image => '/images/icons/youtube_icon.png',
                            :profile_video => 'https://www.youtube.com/watch?v=DlNEjnP6Cyo',
                            :genres => ['rock', 'pop', 'folk', 'acoustic', 'emo', 'dubstep', 'metal', 'progressive', 'jazz', 'rap', 'hip-hop', 'RnB', 'techno', 'funk', 'disco', 'dance'].sample,
                            :influences => ['The Beatles', 'The Rolling Stones', 'David Bowie', 'The Gorillaz', 'The Killers', 'Katy Perry', 'Blondie', 'Elton John', 'Lady Gaga', 'Amy Winehouse', 'Mark Ronson' ].sample,
                            :role => 'registered',
                            :city => ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Stirling'].sample)

    user.profile = profile

    studio = Studio.create!(:user_id => user.id,
                          :status => 'public')
    user.studio = studio
    
    # GENERATE 5 PROJECTS FOR THE SECONDARY ADMIN USER PROFILE

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

          stem = Stem.create!(:description => Faker::Lorem.paragraph(sentence_count = 3), 
                          :key => project.key, 
                          :bpm => project.bpm, 
                          :instrument => ['Piano', 'Drums', 'Bass', 'Mix', 'Electric Guitar', 'Acoustic Guitar', 'Keys', 'Vocal', 'Backing Vocal', 'Percussion', 'Pad', 'Other'].sample,
                          :membership_id => membership.id)

          membership.stems << stem
      
    end


    #GENERATE 100 RANDOM PROFILES WIRTH 5 PROJECTS EACH


      100.times do |c|
     
           user = User.create!(:email => Faker::Internet.email,
                               :password => "password")

          profile = Profile.create!(:user_id => user.id,
                                :first_name => Faker::Name.first_name,
                                :last_name => Faker::Name.last_name,
                                :primary_discipline => ['Drums', 'Guitar', 'Bass', 'Piano', 'Vocal', 'Synth', 'Production', 'DJ', 'Keys'].sample,
                                :profile_name => Faker::Name.name,
                                :youtube_url => 'youtube.com',
                                :soundcloud_url => 'soundcloud.com',
                                :linkedin_url => 'linked_in.com',
                                #:profile_image => '/images/icons/youtube_icon.png',
                                :profile_video => 'youtube.com',
                                :genres => ['rock', 'pop', 'folk', 'acoustic', 'emo', 'dubstep', 'metal', 'progressive', 'jazz', 'rap', 'hip-hop', 'RnB', 'techno', 'funk', 'disco', 'dance'].sample,
                                :influences => ['The Beatles', 'The Rolling Stones', 'David Bowie', 'The Gorillaz', 'The Killers', 'Katy Perry', 'Blondie', 'Elton John', 'Lady Gaga', 'Amy Winehouse', 'Mark Ronson' ].sample,
                                :role => 'registered',
                                :city => ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Stirling'].sample)

        user.profile = profile

        studio = Studio.create!(:user_id => user.id,
                      :status => 'public')
        user.studio = studio
    
    # GENERATE 5 PROJECTS FOR EACH RANDOM PROFILE
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

        stem = Stem.create!(:description => Faker::Lorem.paragraph(sentence_count = 3), 
                        :key => project.key, 
                        :bpm => project.bpm, 
                        :instrument => ['Piano', 'Drums', 'Bass', 'Mix', 'Electric Guitar', 'Acoustic Guitar', 'Keys', 'Vocal', 'Backing Vocal', 'Percussion', 'Pad', 'Other'].sample,
                        :membership_id => membership.id)

        membership.stems << stem

      end
    end

 # create 1000 random friendships between users   

    1000.times do |c|
      user = User.all.sample
      friendship = Friendship.new(:user_id =>  user.id ,
                                  :friend_id => User.all.sample.id,
                                  :approved => [true, false].sample)
      user.friendships << friendship


    end

# Add 1000 status updates to random users

    1000.times do |c|
      user = User.all.sample
      status = Status.create!(:user_id =>  user.id ,
                          :content => Faker::Lorem.paragraph)
      user.statuses << status


    end

# Add 1000 comments from random users to random projects

    1000.times do |c|
      user = User.all.sample
      project = user.projects.all.sample
      comment = Comment.create!(:title => Faker::Hacker.adjective,
                                :content => Faker::Lorem.paragraph,
                                :commentable_id => project.id,
                                :commentable_type => 'project',
                                :user_id => user.id)

      project.comments << comment
      
    end

# Add 1000 comments to random user status updates from random users

    1000.times do |c|
      user = User.all.sample
      status = Status.all.sample
      comment = Comment.create!(:title =>  user.id ,
                                :content => Faker::Lorem.paragraph,
                                :commentable_id => status.id,
                                :commentable_type => 'status',
                                :user_id => user.id)

      status.comments << comment
      
    end


# CREATE 50 Groups by randomly generated users


    50.times do |c|

      user = User.all.sample

      group = Group.create!(:title => Faker::Team.name,
                                :description => Faker::Lorem.paragraph(sentence_count = 3),
                                :creator => user.profile.first_name)



      group_membership = GroupMembership.new(:user_id => user.id,
                              :group_id => group.id)

      group.group_memberships << group_membership

    end


  



  end
end

  