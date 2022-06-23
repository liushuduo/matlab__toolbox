function palette = ColorPalette(name)
% COLORPALETTE provide 
    
    switch lower(name)
        case {'uchicago'}
            palette = {'#800000', '#767676', '#FFA319', '#8A9045', '#155F83', '#C16622', '#8F3931', '#58593F', '#350E20'};
        case {'uchicago_light'}
            palette = {'#800000', '#D6D6CE', '#FFB547', '#ADB17D', '#5B8FA8', '#D49464', '#B1746F', '#8A8B79', '#725663'};
        case {'uchicago_dark'}
            palette = {'#800000', '#767676', '#CC8214', '#616530', '#0F425C', '#9A5324', '#642822', '#3E3E23', '#350E20'};
        otherwise
            error('Unknown palette!');
    end

end

    