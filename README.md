# Send Mail after Main Program
Send an email after calculation (or error occurrence) to any address you want (from your Gmail address)

You can catch the message containing
* briefly summarized title (name of the computer & success or not)
* date and time when your calculation completes
* (optional) the main results of your calculation
* (optional) attachment files

## Requirements
* MATLAB including [`sendmail`](https://www.mathworks.com/help/matlab/ref/sendmail.html) function
* Google account with [**2-Step-Verification**](https://support.google.com/accounts/answer/185839)
* [**App Passwords**](https://support.google.com/mail/answer/185833) for your Google account

## Usage
1. set up the email addresses (in `setup_send.m` file)
    * the sending email address and password<br>
        (this is NOT the password for your Google account itself but **App Passwords** )
    * receiver email address
2. (optional) set up the contents (in `MailAfterMainProgram.m` file)
    * main results
    * attachment file(s) 
      (in default, this program gets all files in `figureDirectoryName`)
3. execute `MailAfterMainProgram` which includes `YOUR_MAIN` program<br>
    (in default, `YOUR_MAIN` is `example_main`)

## Note
* Actually, your sending email address doesn't have to be Gmail, for example, outlook emails, but Gmail is very popular and using it is the easiest way to authenticate your sending address. 