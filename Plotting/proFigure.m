classdef proFigure
    %PROFIGURE Professional-looking figures
    %   Make professional-looking figures easily
    properties
        Figure
    end

    methods
        function obj = proFigure(figureType, varargin)
            arguments
                figureType (1,1) string {mustBeMember(figureType,["draft", "powerPoint"])} = "draft"     
            end

            arguments (Repeating)
                varargin
            end

            % Make professional-looking figures
            obj.Figure = figure(varargin{:});
            hold on;
            box on;
            grid on;
            grid minor;
            set(obj.Figure, 'DefaultTextInterpreter', 'latex');
            set(findall(obj.Figure,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
            set(obj.Figure, 'DefaultLegendInterpreter', 'latex');
            set(obj.Figure, 'DefaultColorbarFontName', 'latex');
            set(obj.Figure, 'DefaultColorbarTickLabelInterpreter', 'latex');
            set(gca, 'DefaultLineLineWidth', 1.2);


            % Add code to change default fontsize if we're making a
            % powerpoint figure
            if figureType == "powerPoint"
                fontsize(obj.Figure,"scale",1.75)
            end

            % Set default plotting colors to Monokai Light
            colors = [0.8941, 0.1020, 0.1098;  % Red
                      0.2157, 0.4941, 0.7216;  % Blue
                      0.3020, 0.6863, 0.2902;  % Green
                      1.0000, 0.4980, 0.0000;  % Orange
                      0.5961, 0.3059, 0.6392;  % Purple
                      0.6510, 0.3373, 0.1569;  % Brown
                      0.9686, 0.5059, 0.7490;  % Pink
                      0.6000, 0.6000, 0.6000]; % Gray

            % Define line styles
            lineStyles = {'-', '--', '-.'};

            % Set ColorOrder and LineStyleOrder
            set(gca, "ColorOrder", colors);
            linestyleorder(gca, lineStyles);

        end

        function varargout = plot(obj, varargin)
            varargout = cell(1, nargout);
            [varargout{:}] = plot(obj.Figure, varargin{:});
        end

        % Add other methods as needed
    end
end
