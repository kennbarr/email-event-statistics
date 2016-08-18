# Email Event Statistics

Installation Instructions
------
1. Clone this repo, then run `bundle install` to install the necessary gems.
2. Run `rake db:create` to create the necessary PostgreSQL database.
3. Run `rails s` to start the server.
4. In a new terminal window, navigate to `email-event-statistics/llirdnam-master/llirdnam`
5. Run `go run llirdnam.go http://localhost:3000` to start sending webhooks to the rails server. This requires Go to be installed and configured on your system.
6. Visit [http://localhost:3000](http://localhost:3000) in a browser to view the email event statistics.
7. Run `rspec` to run the tests.

Reasoning
------
* I originally thought about writing the app with Sinatra and MongoDB because this is a simple application and I thought it should be kept lightweight, but I decided to use Rails and PosgreSQL as they allow for much more flexibility and scalability should the app be extended in the future.
* I've tried to separate concerns wherever possible, using separate controllers for the statistics page and the webhook handling. Stats calculation has been included as a service.
* I used RSpec for testing because, well, RSpec is what I know best and every discussion on the subject I've read assures me that it's superior to the default.

Assumptions
------
* Only three event types will be sent: "send", "open" and "click".
* The denominator used for calculating the open and click rates of an email type is the total number of emails of that type sent.

Further Improvements
------
* The current data being supplied by the sample data generator is not sufficient for meaningful analysis and the compromises made to generate the stats required can lead to misleading information. For example, the event data does not tell us what email in particular they relate to. Ten different "Order" emails could be sent, just one of those emails could be opened ten times, the rest not opened at all, but our statistics would show a 100% open rate. One could make the mistake that all emails were opened. An email reference should be included with all events to allow for proper analysis.
