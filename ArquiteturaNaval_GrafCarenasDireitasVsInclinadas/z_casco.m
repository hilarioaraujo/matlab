function [ z ] = z_casco( y )
y=abs(y);
if y<1
    z=-0.5*sqrt(1-y^2)+0.5;
    
elseif y==1
    z=1;
    
end
    return;

end

