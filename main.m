clear  %初期化
try
    ans = 2/2; %処理するプログラム
%     msg = 'Error occurred.';
%     error(msg)
%    attachmentFileName = 'test.png';
%    attachmentFilePath = './test.png';
catch ME %エラー内容を取得
end
mailsend; %本プログラム
