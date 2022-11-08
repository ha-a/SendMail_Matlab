%%========================================================================
%
% Send email after calculation (or error occurence) 
% to any address you want (from any address also)
% 
% You can catch the message containing
%     * briefly summarized title (name of the computer & success or not)
%     * date and time of calculation completed
%     * (optional) main results of calculation
%     * (optional) attachment files
% 
% Usage
% 1. set up the email addresses (in `mailsend.m` file)
%     * sender email address and password
%     * receiver email address
% 2. (optional) set up the contents (in this `mailAfterMain.m` file)
%     * main results
%     * attachment file(s) 
%       (in default, this program gets all files in `figureDirectoryName`)
% 3. let's calculate!
%
%=========================================================================

clear

try
    % your main program
    main;
    % main results you want to know ASAP
    whatYouWantToSend = strcat('result = ', string(result));

    figureDirectoryName = "./figs/";
    if isfolder(figureDirectoryName)
        attachmentFileLists  = dir(figureDirectoryName);
        attachmentFilePathes = zeros(1,length(attachmentFileLists)-2);
        attachmentFilePathes = string(attachmentFilePathes);
        for i = 3:length(attachmentFileLists)
            attachmentFilePathes(i-2) = figureDirectoryName + attachmentFileLists(i).name;
        end
    end
catch ME % get error message. 
end

mailsend;
