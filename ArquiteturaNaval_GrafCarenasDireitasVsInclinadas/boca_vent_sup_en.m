function y=boca_vent_sup_en(Im)

if min(Im)<0 || max(Im)>1
    return;
end

if Im>=1/2
    y=2;
else
    y=2*sqrt(1-((0.5-Im)/0.5)^2);

end
