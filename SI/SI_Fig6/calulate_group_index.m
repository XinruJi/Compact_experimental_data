function n_g = calulate_group_index(fV,neff)


n_g = neff + fV.*(circshift(neff,1) - circshift(neff,-1)) ./ ...
    (circshift(fV,1) - circshift(fV,-1));

n_g(1) = neff(1) + fV(1).*(neff(2)-neff(1))./(fV(2)-fV(1));
n_g(end) = neff(end) + fV(end).*(neff(end)-neff(end-1))./(fV(end)-fV(end-1));

