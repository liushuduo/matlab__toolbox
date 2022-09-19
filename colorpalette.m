function [palette] = colorpalette(colorName, varargin)
%COLORPALETTE Get a color palette

    p = inputParser();
    addParameter(p, 'Display', false);
    addParameter(p, 'Format', 'hex');
    parse(p, varargin{:});

    % get color palette
    switch lower(colorName)
        
        case 'uchicago'

            palette = {'#800000', '#767676', '#FFA319', '#8A9045', '#155F83', '#C16622', '#8F3931', '#58593F', '#350E20'};
        
        case 'uchicago_light'

            palette = {'#800000', '#D6D6CE', '#FFB547', '#ADB17D', '#5B8FA8', '#D49464', '#B1746F', '#8A8B79', '#725663'};
        
        case "uchicago_dark"

            palette= {'#800000', '#767676', '#CC8214', '#616530', '#0F425C', '#9A5324', '#642822', '#3E3E23', '#350E20'};
        
        case "npg"

            palette = {'#E64B35', '#4DBBD5', '#00A087', '#3C5488', '#F39B7F', '#8491B4', '#91D1C2', '#DC0000', '#7E6148', '#B09C85'};
        
        case "nejm"
            palette = {'#BC3C29', '#0072B5', '#E18727', '#20854E', '#7876B1', '#6F99AD', '#FFDC91', '#EE4C97'};
        
        case "lancet"
            palette = {'#00468B', '#ED0000', '#42B540', '#0099B4', '#925E9F', '#FDAF91', '#AD002A', '#ADB6B6', '#1B1919'};
        
        case "jama"
            palette = {'#374E55', '#DF8F44', '#00A1D5', '#B24745', '#79AF97', '#6A6599', '#80796B'};
    
        case "jco"
            palette = {'#0073C2', '#EFC000', '#868686', '#CD534C', '#7AA6DC', '#003C67', '#8F7700', '#3B3B3B', '#A73030', '#4A6990'};
    
        case "d3"
            palette = {'#1F77B4', '#FF7F0E', '#2CA02C', '#D62728', '#9467BD', '#8C564B', '#E377C2', '#7F7F7F', '#BCBD22', '#17BECF'};
    
        case "locuszoom"
            palette = {'#D43F3A', '#EEA236', '#5CB85C', '#46B8DA', '#357EBD', '#9632B8', '#B8B8B8'};
    
        case "cosmic"
            palette = {'#2E2A2B', '#CF4E9C', '#8C57A2', '#358DB9', '#82581F', '#2F509E', '#E5614C', '#97A1A7', '#3DA873', '#DC9445'};
    
        case "cosmic_dark"
            palette = {'#171717', '#7D0226', '#300049', '#165459', '#3F2327', '#0B1948', '#E71012', '#555555', '#193006', '#A8450C'};
    
        case "startrek"
            palette = {'#CC0C00', '#5C88DA', '#84BD00', '#FFCD00', '#7C878E', '#00B5E2', '#00AF66'};
        
        case "tron"
            palette = {'#FF410D', '#6EE2FF', '#F7C530', '#95CC5E', '#D0DFE6', '#F79D1E', '#748AA6'};
        
        case "futurama"
            palette = {'#FF6F00', '#C71000', '#008EA0', '#8A4198', '#5A9599', '#FF6348', '#84D7E1', '#FF95A8', '#3D3B25', '#ADE2D0', '#1A5354', '#3F4041'};
    
        case "rickandmorty"
            palette = {'#FAFD7C', '#82491E', '#24325F', '#B7E4F9', '#FB6467', '#526E2D', '#E762D7', '#E89242', '#FAE48B', '#A6EEE6', '#917C5D', '#69C8EC'};
        
        case "simpsons"
            palette = {'#FED439', '#709AE1', '#8A9197', '#D2AF81', '#FD7446', '#D5E4A2', '#197EC0', '#F05C3B', '#46732E', '#71D0F5', '#370335', '#075149', '#C80813', '#91331F', '#1A9993', '#FD8CC1'};
        
        case "gsea"
            palette = {'#4500AC', '#2600D1', '#6B58EE', '#8787FF', '#C6C0FF', '#D4D4FF', '#FFBFE5', '#FF8888', '#FF707F', '#FF5959', '#EE3F3F', '#D60C00'};
    
        case "zju"
            palette = {'#003F88', '#B01F24', '#DCC100', '#86A959', '#F0F7FD', '#A9695D'};
    
        case "ieee_foundation"
            palette = {'#0066A1', '#CE8E00', '#008542', '#000000'};
        
        case "ieee_light"
            palette = {'#00629B', '#BA0C2F', '#FFA300', '#FFD100', '#78BE20', '#00843D', '#981D97', '#009CA6', '#00B5E2', '#FFFFFF'};
    
        case "ieee_dark"
            palette = {'#861F41', '#E87722', '#FFC72C', '#658D18', '#006341', '#772583', '#007377', '#002855', '#75787B', '#000000'};

        otherwise
            error('No such color palette!')

    end

    % display color palette
    if p.Results.Display

        nColor = length(palette);
        nRow = round(sqrt(nColor));
        nCol = ceil(nColor/nRow);

        % set up canvas size, 2 inches for a single color block
        fH = figure();
        tH = tiledlayout(fH, 1, 1, 'TileSpacing', 'tight', Padding='tight');
        tH.Units = 'inches';
        tH.OuterPosition = [0 0 2 * nCol, 2 * nRow];
        aH = nexttile;
        hold(aH, 'on')
        fH.Units = 'inches';
        fH.Position(3:4) = tH.OuterPosition(3:4) * 1.1;

        count = 0;
        for ii = 1 : nRow
            for jj = 1 : nCol
                Y = [ii-1, ii, ii, ii-1];
                X = [jj-1, jj-1, jj, jj];
                pH = patch(X, Y, 'w');

                count = count + 1;
                if count <= nColor
                    
                    pH.FaceColor = palette{count};

                    rgb = hex2rgb(palette{count});

                    if (rgb(1)*0.299 + rgb(2)*0.587 + rgb(3)*0.114) > 128/255
                        text(jj-.5, ii-.5, palette{count}, 'HorizontalAlignment','center', 'FontSize', 18, 'Color', 'k');
                    else
                        text(jj-.5, ii-.5, palette{count}, 'HorizontalAlignment','center', 'FontSize', 18, 'Color', 'w');
                
                    end
                end
                
            end
        end

        axis equal
        axis off
        set(gca, 'YDir', 'reverse')
        title(strrep(colorName, '_', ' '), 'FontSize', 20);
    
    end

    % output color format
    switch lower(p.Results.Format)

        case 'hex'
            % do nothing

        case 'rgb'
            palette = hex2rgb(palette);
        
        otherwise
            error('Format is not supported!')

    end

    % sub-function: convert hex to rgb
    function rgb = hex2rgb(hexString)
        
        if hexString(1) == '#'
            hexString = hexString(2:end);
        end
        
        if size(hexString,2) ~= 6
            error('invalid input: not 6 characters');
        else
                r = double(hex2dec(hexString(1:2)))/255;
                g = double(hex2dec(hexString(3:4)))/255;
                b = double(hex2dec(hexString(5:6)))/255;
                rgb = [r, g, b];
        end
    end

end

