function numDigits = countDigits(number)
    % Count the number of digits in a number up to the decimal point.

    numStr = num2str(abs(number));

    % Assumes the number is an integer.
    numDigits = strlength(numStr);