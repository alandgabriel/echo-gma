function [val, gL_curve, L] = compute_global_strain(dl,timing,ES)

drift_comp = 1; % flag for drift compensation
L = dl;

% L = L(end,:); % total length
gL_curve = 100 * (L - L(1)) ./ L(1);
% frame_ref = 50;
if drift_comp
    gL_curve = drift_compensation(gL_curve);
end

switch timing
    
    case 'ES'
        val = gL_curve(ES);
        
    case 'PeakS'
        %         val = min(gL_curve);
        val = min(gL_curve(ES:end));
        
    case 'PeakG'
        val = min(gL_curve);
        %         val = min(gL_curve(ES:end));
        
    case 'PeakP'
        val = max(gL_curve);
        
end
debug();

end