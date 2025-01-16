% piNum2TeX - Converts multiples of pi to LaTeX formatted strings
%
% Syntax:
%   str = piNum2TeX(piMultiple)
%
% Inputs:
%   piMultiple - A vector of multiples of pi
%
% Outputs:
%   str - A string array of LaTeX formatted strings representing the multiples of pi
%
% Description:
%   The piNum2TeX function takes a vector of multiples of pi and converts them to LaTeX formatted strings.
%   It uses the rat function to convert the multiples to fractions and then creates the LaTeX formatted strings
%   using vectorized operations. The resulting strings are returned in a string array.
%
% Example:
%   piMultiple = [0, 1, -1, 2/3, -5/4];
%   str = piNum2TeX(piMultiple);
%
%   str =
%       '$0$'       % 0
%       '$\pi$'     % pi
%       '$-\pi$'    % -pi
%       '$\frac{2}{3}\pi$'    % 2/3*pi
%       '$-\frac{5}{4}\pi$'   % -5/4*pi
%
% Notes:
%   - The function assumes that the input vector contains only multiples of pi.
%   - The resulting strings are formatted using LaTeX syntax for mathematical expressions.
function str = piNum2TeX(piMultiple)
    k = piMultiple / pi;

    % Convert the multiples to fractions
    [num, den] = rat(k);

    % Initialize an empty string array
    str = strings(size(piMultiple));

    % Create the LaTeX formatted strings using vectorized operations
    for i = 1:length(piMultiple)
        if num(i) == 0
            str(i) = '$0$';
        elseif num(i) == den(i)
            str(i) = '$\pi$';
        elseif num(i) == -den(i)
            str(i) = '$-\pi$';
        elseif den(i) == 1
            str(i) = sprintf('$%d\\pi$', num(i));
        else
            str(i) = sprintf('$\\frac{%d}{%d}\\pi$', num(i), den(i));
        end
    end
