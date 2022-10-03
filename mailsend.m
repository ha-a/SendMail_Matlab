
% 送信元のアドレス，パスワード
Mail.sendAdd = 'shime.hajime2468@gmail.com';
Mail.sendPassword = 'hfdewefeibfohsyt';
% Gmail サーバー
setpref('Internet','SMTP_Server','smtp.gmail.com');

% 送信元アドレス設定
% SMTP設定
setpref('Internet','E_mail',Mail.sendAdd);
setpref('Internet','SMTP_Username',Mail.sendAdd);
setpref('Internet','SMTP_Password',Mail.sendPassword);

% Java 設定
Mail.Props = java.lang.System.getProperties;
Mail.Props.setProperty('mail.smtp.auth','true');
Mail.Props.setProperty('mail.smtp.socketFactory.class', ...
    'javax.net.ssl.SSLSocketFactory');
Mail.Props.setProperty('mail.smtp.socketFactory.port','465');

% 計算しているパソコン名取得
[~,Mail.namePC] = dos('hostname');

% メール送信先の指定
Mail.receiveAdd='asakura.hibiki.42c@st.kyoto-u.ac.jp';

% メール本文
Mail.isME = exist('ME','var');
Mail.isFile = exist('attachmentFileName','var');
if Mail.isME == 1
%エラーがあれば、メールのタイトルにエラー通知(Tmp.mailTitle)、内容にエラー文(Mail.errorMsg)を含むメッセージ(Tmp.mailMessage)を指定　
    Mail.errorMsg=ME.message; %エラー文を取得
    Mail.mailTitle=strcat(Mail.namePC,': !Calculation Error'); %エラーメールタイトル
    Mail.mailMessage=strcat('エラーメッセージ:',Mail.errorMsg); %エラーメッセージ
else
%エラーが無ければ、メールのタイトルに計算完了通知(Tmp.mailTitle)、内容にメッセージ(Tmp.mailMessage)を指定　　           
    Mail.mailTitle=strcat(Mail.namePC,': Finish Calculation');
    message_line1 = strcat('Datetime: [ ', datestr(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z')), ' ]');
    if Mail.isFile == 1
        message_line2 = strcat('Attachment: [ ', char(attachmentFileName), ' ]');
        Mail.attachmentFilePath = char(attachmentFilePath);
        Mail.mailMessage = [message_line1 10 message_line2];
    else
        Mail.attachmentFilePath = '';
        Mail.mailMessage = message_line1;
    end
end

sendmail(Mail.receiveAdd,Mail.mailTitle,Mail.mailMessage,Mail.attachmentFilePath);