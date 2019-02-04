function [ dir_vent ] = direcao_vento( ang_rel,rumo )

if (ang_rel+rumo)<360
    aux=ang_rel+rumo;
else
    aux=ang_rel+rumo-360;
end

if aux>=0
    dir_vent=aux;
    
else
    dir_vent=360+aux;
end

end

