# Send mail after main
Send email after calculation (or error occurence) to any address you want (from any address also)

You can catch the message containing
* briefly summarized title (name of the computer & success or not)
* date and time of calculation completed
* (optional) main results of calculation
* (optional) attachment files
 
## Usage
1. set up the email addresses (in `mailsend.m` file)
    * sender email address and password
    * receiver email address
1. (optional) set up the contents (in this `mailAfterMain.m` file)
    * main results
    * attachment file(s) 
      (in default, this program gets all files in `figureDirectoryName`)
1. let's calculate!
