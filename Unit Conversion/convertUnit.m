function [outNumber, outUnit] = convertUnit(SINumber, SIBaseUnit)
    % Given a metric unit, convert the unit so that the output number is between 1 and 1000.
    % Assumes that the input is in base SI units.
    arguments
        SINumber (:, 1) double {mustBeNumeric}
        SIBaseUnit (:, 1) string
    end

    [outNumber, ~, SIoutUnitChar] = engunits(SINumber);

    outUnit = string(SIoutUnitChar) + SIBaseUnit;
