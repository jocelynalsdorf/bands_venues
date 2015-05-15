Author: Jocelyn Alsdorf

Program name: Bands and Venues App

Description: This app allows a user to add/edit/delete bands and add venues where a band has played to the band's page. The user can also add bands to specific venues.

Set-up Instructions: Ruby with ActiveRecord (no rails)

Schema template XML file included (database_schema.txt)
may use template at:http://ondras.zarovi.cz/sql/demo/

The gems used:

gem("sinatra-contrib", :require => "sinatra/reloader")
gem("sinatra-activerecord")
gem("rake")
gem("pg")
gem("sinatra")
gem("pry")

group(:test) do
gem("rspec")
gem("capybara")

ActiveRecord Instructions:

(rake db:drop if already connected to a db)
rake db:create

rake db:create_migration NAME=create_bands
---make tables in migration files-----
rake db:migrate
rake db:create_migration NAME=create_venues
---make tables in migration files-----
rake db:migrate
rake db:create_migration NAME=create_bands_venues
---make tables in migration files-----
rake db:migrate

rake db:test:prepare



Copying/license: The MIT License (MIT)

Copyright (c) 2015 Jocelyn Alsdorf

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
