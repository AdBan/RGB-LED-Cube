function out = MapValue(in, inMin, inMax, outMin, outMax)
%MapValue Maps value 'in' which is in range of inMin to inMax to value in
%range of outMin to outMax
    out = (in - inMin)/(inMax - inMin) * (outMax - outMin) + outMin;
end

