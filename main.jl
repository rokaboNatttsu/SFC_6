using StatsPlots

N=201

Cw, Ci, C, I, G = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
W, Wf, Wb, Wg = zeros(N), zeros(N), zeros(N), zeros(N)
Tiw, Tii, Ti, Tv, Tff, Tfb, Tf = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
Pi, P, Pf, Pb, S = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
NLw, NLi, NLf, NLb, NLg = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
ΔMw, ΔMi, ΔMf, ΔM = zeros(N), zeros(N), zeros(N), zeros(N)
ΔLw, ΔLf, ΔL = zeros(N), zeros(N), zeros(N)
Δei, Δeb, Δe = zeros(N), zeros(N), zeros(N)
ΔEi, ΔEb, ΔE = zeros(N), zeros(N), zeros(N)
ΔGBi, ΔGBb, ΔGB = zeros(N), zeros(N), zeros(N)
ΔHw, ΔHb, ΔH = zeros(N), zeros(N), zeros(N)
K = zeros(N)
Mw, Mi, Mf, M = zeros(N), zeros(N), zeros(N), zeros(N)
Lw, Lf, L = zeros(N), zeros(N), zeros(N)
ei, eb, e = zeros(N), zeros(N), zeros(N)
Ei, Eb, E = zeros(N), zeros(N), zeros(N)
GBi, GBb, GB = zeros(N), zeros(N), zeros(N)
Hw, Hb, H = zeros(N), zeros(N), zeros(N)
NWw, NWi, NWf, NWb, NWg, NW = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
Vi, Vb, Vie, Vbe, ΔVi, ΔVb = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
Eie, GBie, Ebe, GBbe = zeros(N), zeros(N), zeros(N), zeros(N)
pe, Δpe = zeros(N), zeros(N)
rL, rGB, uT = 0.01, 0.03, 0.7
α1, α2, α3 = 0.95, 0.05, 0.02
β1, β2, β3 = 1, 0.05, 1
γ = 0.02
δ = 0.7
ϵ1, ϵ2, ϵ3, ϵ4 = 0.3, 0.1, 0.2, 0.2
ζ = 0.3
η1, η2, η3, η4, η5 = 5, 0.5, 0.3, 0.5, 0.01
θ = 0.3
λV, λw = 0.5, 0.5
λ10, λ20, λ30 = 0.2, 0.4, 0.4
λ11, λ12, λ13 = 1, -0.5, -0.5
λ21, λ22, λ23 = -0.5, 1, -0.5
λ31, λ32, λ33 = -0.5, -0.5, 1
λ40, λ50 = 0.5, 0.5
λ41, λ42 = 0.7, -0.7
λ51, λ52 = -0.7, 0.7
G0, Wg0 = 1,1
G[1], Wg[1], W[1] = G0, Wg0, Wg0
pe[1] = 1
K[1] = 6
Mw[1], Mi[1], Mf[1], M[1] = 1,1,1,3
ei[1], eb[1], e[1] = 2,2,4
Ei[1], Eb[1], E[1] = pe[1]*ei[1], pe[1]*eb[1], pe[1]*e[1]
GBi[1], GBb[1], GB[1] = 1,1,2
Hb[1], H[1] = η5*M[1],η5*M[1]
NWw[1] = Mw[1] - Lw[1] + Hw[1]
NWi[1] = Mi[1] + Ei[1] + GBi[1]
NWf[1] = Mf[1] - Lf[1] - E[1] + K[1]
NWb[1] = -M[1] + L[1] + Eb[1] + GBb[1] + Hb[1]
NWg[1] = -GB[1] - H[1]
NW[1] = K[1]
Vi[1], Vb[1], Vie[1], Vbe[1] = Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1], Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1]

function run(time_range::UnitRange)
    for t=time_range
        Wf[t] = (1-λw)*Wf[t-1] + λw*δ*(C[t-1]+I[t-1]+G[t-1])
        Wb[t] = (1-λw)*Wb[t-1] + λw*δ*(Pb[t-1]+rL*L[t-1]+rGB*GBb[t-1])
        Wg[t] = Wg0*exp(γ*t)
        W[t] = Wf[t] + Wb[t] + Wg[t]
        Tiw[t] = ϵ1*W[t]
        G[t] = G0*exp(γ*t)
        I[t] = max(0, min(((C[t]+G[t])/(β1*K[t-1]) - uT)*K[t-1] + β2*K[t-1], β3*(Mf[t-1]-Lf[t-1])))
        Cw[t] = α1*(W[t]-Tiw[t]-rL*Lw[t-1]) + α2*NWw[t-1]
        Ci[t] = α3*(Pi[t-1]-Tii[t-1]+rGB*GBi[t-1])
        C[t] = Cw[t] + Ci[t]
        Tv[t] = ϵ2*(C[t]+G[t]+I[t])
        Tff[t] = max(0, ϵ3*(C[t]+G[t]+I[t]-Wf[t]-Tv[t]-rL*Lf[t-1]))
        P[t] = C[t]+G[t]+I[t]-Wf[t]-Tv[t]-Tff[t]-rL*Lf[t-1]
        Pi[t] = ζ*(P[t]-I[t])*Ei[t-1]/E[t-1]
        Pb[t] = ζ*(P[t]-I[t])*Eb[t-1]/E[t-1]
        Pf[t] = P[t]-Pi[t]-Pb[t]
        S[t] = θ*Pb[t]
        Tii[t] = ϵ4*(Pi[t]+S[t]+rGB*GBi[t-1])
        Ti[t] = Tiw[t] + Tii[t]
        Tfb[t] = max(0, ϵ3*(-Wb[t]+Pb[t]+rL*L[t-1]+rGB*GBb[t-1]))
        Tf[t] = Tff[t] + Tfb[t]
        NLw[t] = -Cw[t]+W[t]-Tiw[t]-rL*Lw[t-1]
        NLi[t] = -Ci[t]+Pi[t]+S[t]-Tii[t]+rGB*GBi[t-1]
        NLf[t] = Pf[t] - I[t]
        NLb[t] = -Wb[t] - Tfb[t] + Pb[t] - S[t] + rL*L[t-1] + rGB*GBb[t-1]
        NLg[t] = -G[t] - Wg[t] + Ti[t] + Tv[t] + Tf[t] - rGB*GB[t-1]
        Lw[t] = η1*(W[t] - Ti[t])
        ΔLw[t] = Lw[t] - Lw[t-1]
        Hw[t] = η2*Cw[t]
        ΔHw[t] = Hw[t] - Hw[t-1]
        ΔMw[t] = NLw[t] + ΔLw[t] - ΔHw[t]
        Mw[t] = Mw[t-1] + ΔMw[t]
        Vie[t] = (1-λV)*Vie[t-1] + λV*Vi[t-1]^2/(Vi[t-1]-ΔVi[t-1])
        Vbe[t] = (1-λV)*Vbe[t-1] + λV*Vb[t-1]^2/(Vb[t-1]-ΔVb[t-1])
        Δe[t] = η3*(I[t]-β2*K[t-1])/pe[t-1]
        e[t] = e[t-1] + Δe[t]
        Lf[t] = max(0, (1+η4)*W[t]-Mf[t-1])
        ΔLf[t] = Lf[t] - Lf[t-1]
        ΔL[t] = ΔLw[t] + ΔLf[t]
        L[t] = L[t-1] + ΔL[t]
        ΔMf[t] = NLf[t] + ΔLf[t]
        Mf[t] = Mf[t-1] + ΔMf[t]
        Mi[t] = (λ10 + λ12*ζ*(P[t-1]-I[t-1])/E[t-1] + λ13*rGB)*Vie[t]
        Eie[t] = (λ20 + λ22*ζ*(P[t-1]-I[t-1])/E[t-1] + λ23*rGB)*Vie[t]
        GBie[t] = (λ30 + λ32*ζ*(P[t-1]-I[t-1])/E[t-1] + λ33*rGB)*Vie[t]
        ΔMi[t] = Mi[t] - Mi[t-1]
        ΔM[t] = ΔMw[t] + ΔMi[t] + ΔMf[t]
        M[t] = M[t-1] + ΔM[t]
        Hb[t] = η5*M[t]
        ΔHb[t] = Hb[t] - Hb[t-1]
        ΔH[t] = ΔHw[t] + ΔHb[t]
        H[t] = H[t-1] + ΔH[t]
        ΔGB[t] = -NLg[t] - ΔH[t]
        GB[t] = GB[t-1] + ΔGB[t]
        Ebe[t] = (λ40 + λ41*ζ*(P[t-1]-I[t-1])/E[t-1] + λ42*rGB)*Vbe[t]
        GBbe[t] = (λ50 + λ51*ζ*(P[t-1]-I[t-1])/E[t-1] + λ52*rGB)*Vbe[t]
        GBi[t] = GB[t]*GBie[t]/(GBie[t]+GBbe[t])
        GBb[t] = GB[t]*GBbe[t]/(GBie[t]+GBbe[t])
        ΔGBi[t] = GBi[t] - GBi[t-1]
        ΔGBb[t] = GBb[t] - GBb[t-1]
        pe[t] = (Eie[t] + Ebe[t])/e[t]
        Δpe[t] = pe[t] - pe[t-1]
        Δei[t] = (NLi[t] - ΔMi[t] - ΔGBi[t])/pe[t]
        Δeb[t] = Δe[t] - Δei[t]
        ei[t] = ei[t-1] + Δei[t]
        eb[t] = eb[t-1] + Δeb[t]
        ΔEi[t] = Δpe[t]*ei[t-1] + pe[t]*Δei[t]
        ΔEb[t] = Δpe[t]*eb[t-1] + pe[t]*Δeb[t]
        Ei[t] = Ei[t-1] + ΔEi[t]
        Eb[t] = Eb[t-1] + ΔEb[t]
        Vi[t] = Mi[t] + Ei[t] + GBi[t]
        Vb[t] = Eb[t] + GBb[t]
        ΔE[t] = ΔEi[t] + ΔEb[t]
        E[t] = E[t-1] + ΔE[t]
        K[t] = (1-β2)*K[t-1] + I[t]
        NWw[t] = Mw[t] - Lw[t] +Hw[t]
        NWi[t] = Mi[t] + Ei[t] + GBi[t]
        NWf[t] = Mf[t] - Lf[t] - E[t] + K[t]
        NWb[t] = -M[t] +L[t] + Eb[t] + GBb[t] + Hb[t]
        NWg[t] = -GB[t] - H[t]
        NW[t] = K[t]
    end
end

run(2:N)

plot(C, label="C")
plot!(G, label="G")
plot!(I, label="I")
savefig("figs/Y.png")

plot(W, label="W")
plot!(Wf, label="Wf")
plot!(Wb, label="Wb")
plot!(Wg, label="Wg")
savefig("figs/W.png")

plot(Mw, label="Mw")
plot!(Mi, label="Mi")
plot!(Mf, label="Mf")
plot!(M, label="M")
savefig("figs/M.png")

plot(e, label="e")
plot!(ei, label="ei")
plot!(eb, label="eb")
savefig("figs/e.png")

plot(NWw, label="NWw")
plot!(NWi, label="NWi")
plot!(NWf, label="NWf")
plot!(NWb, label="NWb")
plot!(NWg, label="NWg")
savefig("figs/NW.png")
