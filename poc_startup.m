% Startup file configured in this MATLAB Project. MATLAB runs it automatically
% when the project is opened.
%
% Benign on purpose: it appends one line to a marker file and prints where it
% wrote. No network access, no data is read or sent anywhere, nothing is
% modified outside a temp/home file created by this script.
try
    candidates = {tempdir, getenv('HOME'), pwd};
    written = '';
    for k = 1:numel(candidates)
        d = candidates{k};
        if isempty(d) || ~isfolder(d)
            continue
        end
        target = fullfile(d, 'poc_marker.txt');
        f = fopen(target, 'a');
        if f ~= -1
            fprintf(f, '[%s] PROJECT STARTUP EXECUTED | pwd=%s | user=%s | host=%s\n', ...
                char(datetime('now')), pwd, getenv('USER'), getenv('HOSTNAME'));
            fclose(f);
            written = target;
            break
        end
    end
    if isempty(written)
        disp('PROJECT STARTUP EXECUTED (no writable location found)');
    else
        disp(['PROJECT STARTUP EXECUTED -> ' written]);
    end
catch ME
    disp(['payload error: ' ME.message]);
end
