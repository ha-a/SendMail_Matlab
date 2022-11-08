

%% Setting of mail sender (gmail)
%  address
Mail.sendAdd      = '****************@gmail.com';
%  password
%  this is the password for google account but "App Passwords"
%  https://support.google.com/mail/answer/185833?hl=en
Mail.sendPassword = '****************';
%  Gmail server
setpref('Internet','SMTP_Server','smtp.gmail.com');

%% Setting of mail receiver
Mail.receiveAdd='****************@*******';

%% Other settings

% Setting of SMTP
setpref('Internet','E_mail',Mail.sendAdd);
setpref('Internet','SMTP_Username',Mail.sendAdd);
setpref('Internet','SMTP_Password',Mail.sendPassword);

% Setting of Java
Mail.Props = java.lang.System.getProperties;
Mail.Props.setProperty('mail.smtp.auth','true');
Mail.Props.setProperty('mail.smtp.socketFactory.class', ...
                       'javax.net.ssl.SSLSocketFactory');
Mail.Props.setProperty('mail.smtp.socketFactory.port','465');

% get the name of calculating PC
[~,Mail.namePC] = dos('hostname');


%% body of mail
Mail.isME      = exist('ME','var');
Mail.isFile    = exist('attachmentFileLists','var');
Mail.isMessage = exist('whatYouWantToSend','var');
Mail.attachmentFilePath = '';

if Mail.isME == 1
% when you get error message
    Mail.errorMsg    = ME.message;
    Mail.mailTitle   = strcat(Mail.namePC,': !Calculation Error');
    Mail.mailMessage = strcat('エラーメッセージ: ',Mail.errorMsg);
else
% when your caluculation is successfully finished
    Mail.mailTitle   = strcat(Mail.namePC,': Finish Calculation');

    Mail.mailMessage = strcat('Datetime: [ ', ...
                         string(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z')), ' ]');

% if you have whatYouWantToSend (for example main results of calculation)
    if Mail.isMessage == 1
        Mail.mailMessage = [Mail.mailMessage, whatYouWantToSend];
    end

% if you have any attachment file to send
    if Mail.isFile == 1
        for i = 3:length(attachmentFileLists)
            message_line2 = strcat('Attachment: [ ', char(attachmentFileLists(i).name), ' ]');
            Mail.mailMessage = [Mail.mailMessage, message_line2];
        end
        Mail.attachmentFilePath = attachmentFilePathes;
    end
end

Mail.mailMessage = cellstr(Mail.mailMessage);


%% Send mail
sendmail(Mail.receiveAdd,Mail.mailTitle,Mail.mailMessage,Mail.attachmentFilePath);