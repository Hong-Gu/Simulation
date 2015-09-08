function dpsi = vdde(u,head,uf_bar)
    E_star = 15.84;
    dpsi = -E_star*u / sqrt(1 - ((1 + uf_bar^4)/uf_bar)*u + u^4);
end

