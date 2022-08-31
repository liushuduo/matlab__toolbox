function [fH] = ConfigFigure(aH, size_cm, varargin)
%CONFIGFIGURE Config figure for specific scenarioes
%   figHandle: handle of figure to process
%   axisHandle: handle of axis to process
%   format: scenario of the figure to be used in
%       'ieeetwocolumn' - two columns figure for IEEE publications
%       'ieeeonecolumn' - single column figure for IEEE publications
%       'presentation'  - figure to be used in a slide
%       'default'       - merely show figure

%   Created by Liu Shuduo. 
%   Signal Space and Information System Lab, ISEE, ZJU
%   Email:      sliu35@zju.edu.cn


    % parse input arguments
    p = inputParser;
    addParameter(p, 'format', 'presentation');
    parse(p, varargin{:})
    
    fH = figure('Position', [0 0 800 600]);
    tH = tiledlayout(fH, 1, 1, 'TileSpacing','tight', 'Padding','tight');
    
    switch lower(format)
        
        case 'ieeetwocolumn'
            tH.Units = 'inches';
            tH.OuterPosition = [0 0 7.16 7.16/5*3];
            newAH = nexttile;
            copyobj(aH, newAH);
                
            % IEEE suggest fonts: Times New Roman, Helvetica, Cambira and Arial
            newAH.FontName = 'Times New Roman';   
            
            % Font size in figure should be 8-10 pts. 
            newAH.FontSize = 8;        
    
        case 'ieeeonecolumn'
            tH.Units = 'inches';
            tH.OuterPosition = [0 0 3.5 3.5/5*4];
            newAH = nexttile;
            copyobj(aH, newAH);
                
            % IEEE suggest fonts: Times New Roman, Helvetica, Cambira and Arial
            newAH.FontName = 'Times New Roman';   
            
            % Font size in figure should be 8-10 pts. 
            newAH.FontSize = 8;  

        case 'elsevieronecolomn'
            tH.Units = 'centimeters';
            tH.OuterPosition = [0 0 3.5 3.5/5*4];
            newAH = nexttile;
            copyobj(aH, newAH);
                
            newAH.FontName = 'Arial';   
            newAH.FontSize = 8;  
            
        case 'presentation'
   
            
        otherwise
            tH.Units = 'centimeters';
            tH.OuterPosition = size_cm;
            newAH = nexttile;
            copyobj(aH, newAH);
            
    end
    

end

