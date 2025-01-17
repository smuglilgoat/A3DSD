S = [9; 7; 3; 5]
% N = 512; name = 'piece-regular';
% f = load_signal(name,N);
% f = f-min(f); % pour que le signal n’ait que des valeurs positives
% clf; subplot(2,1,1); plot(f); axis('tight'); title('Signal');
% plot_wavelet(f, 0)

d10 = d(1,0)
d11 = d(1,1)
d20 = d(2,0)
d30 = d(3,0)

transpose(S) * d30
transpose(S) * d20
transpose(S) * d11
transpose(S) * d10

function d_mn = d(m, n)
    ans = [];
    for t = 0:3
        ans = [ans; psi(m, n ,t)];
    end
    d_mn = ans;
end

function psi_t = psi_mere(t)
    if t < 0.5 & t >= 0
        psi_t = 1;
    elseif t >= 0.5 & t < 1
        psi_t = -1;
    else 
        psi_t = 0;
    end
end

function psi_mn_t = psi(m, n ,t)
    psi_mn_t = 2^(-m) * psi_mere((2^(-m) * t) - n);
end
