% Copyright 2026 The Community, Inc.
        function tf = isCompatible(obj, otherBuffer)
            tf = obj.SampleRate == otherBuffer.SampleRate && ...
                 size(obj.Data,2) == size(otherBuffer.Data,2);
        end
