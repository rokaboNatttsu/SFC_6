using StatsPlots

N=201

Cw, Ci, C, Caw, Cai, Ca, I, G = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
W, Wf, Wb, Wg = zeros(N), zeros(N), zeros(N), zeros(N)
Tiw, Tii, Ti, Tv, Tff, Tfb, Tf, Taw, Tai, Taf, Ta, Tci, Tcb, Tc = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
Pi, P, Pf, Pb, IT, Sw, Si = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
NLw, NLi, NLf, NLb, NLg = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
ΔMw, ΔMi, ΔMf, ΔM = zeros(N), zeros(N), zeros(N), zeros(N)
ΔLw, ΔLf, ΔL = zeros(N), zeros(N), zeros(N)
Δei, Δeb, Δe = zeros(N), zeros(N), zeros(N)
ΔEi, ΔEb, ΔE = zeros(N), zeros(N), zeros(N)
ΔGBi, ΔGBb, ΔGB = zeros(N), zeros(N), zeros(N)
ΔHw, ΔHb, ΔH = zeros(N), zeros(N), zeros(N)
Kf, Kw, Ki, K = zeros(N), zeros(N), zeros(N), zeros(N)
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
rL, rGB, uT = 0.01, 0.02, 0.8
α1, α2, α3, α4, α5 = 0.95, 0.05, 0.1, 0.9, 0.7
β1, β2, β3, β4 = 1, 0.05, 1, 0.05
γ = 0.02
δ = 0.68
ϵ1, ϵ2, ϵ3, ϵ4, ϵ5, ϵ6, ϵ7, ϵ8, ϵ9 = 0.2, 0.1, 0.2, 0.2, 0.03, 0.02, 0.2, 0.01, 0.01
ζ1, ζ2 = 0.3, 0.05
η1, η2, η3, η4, η5 = 5, 0.5, 1, 1, 0.01
θ1, θ2 = 0.3, 0.2
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
Kf[1], K[1] = 6, 6
Mw[1], Mi[1], Mf[1], M[1] = 1,1,1,3
ei[1], eb[1], e[1] = 2,2,4
Ei[1], Eb[1], E[1] = pe[1]*ei[1], pe[1]*eb[1], pe[1]*e[1]
GBi[1], GBb[1], GB[1] = 1,1,2
Hb[1], H[1] = η5*M[1],η5*M[1]
NWw[1] = Mw[1] - Lw[1] + Hw[1]
NWi[1] = Mi[1] + Ei[1] + GBi[1]
NWf[1] = Mf[1] - Lf[1] - E[1] + Kf[1]
NWb[1] = -M[1] + L[1] + Eb[1] + GBb[1] + Hb[1]
NWg[1] = -GB[1] - H[1]
NW[1] = K[1]
Vi[1], Vb[1], Vie[1], Vbe[1] = Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1], Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1]

function run(time_range::UnitRange)
    for t=time_range
        Wf[t] = (1-λw)*Wf[t-1] + λw*δ*(C[t-1]+Ca[t-1]+I[t-1]+G[t-1]-Tv[t-1]-Taf[t]-rL*Lf[t-1])
        Wb[t] = (1-λw)*Wb[t-1] + λw*δ*(-Tcb[t-1]-IT[t-1]+Pb[t-1]+rL*L[t-1]+rGB*GBb[t-1])
        Wg[t] = Wg0*exp(γ*t)
        W[t] = Wf[t] + Wb[t] + Wg[t]
        Tiw[t] = ϵ1*W[t]
        Tci[t] = max(0, ϵ7*Δpe[t-1]*(ei[t-1]-Δei[t-1])+ϵ9*(Ei[t-1]-ΔEi[t-1]))
        Tcb[t] = max(0, ϵ7*Δpe[t-1]*(eb[t-1]-Δeb[t-1])+ϵ9*(Eb[t-1]-ΔEb[t-1]))
        Tc[t] = Tci[t] + Tcb[t]
        G[t] = G0*exp(γ*t)
        Cw[t] = α4*(α1*(W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]) + α2*(NWw[t-1]-Kw[t-1]))
        Ci[t] = α5*α3*(Pi[t-1]+IT[t-1]-Tii[t-1]-Tai[t]-Tci[t]+rGB*GBi[t-1])
        C[t] = Cw[t] + Ci[t]
        Caw[t] = (1 - α4)*(α1*(W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]) + α2*(NWw[t-1]-Kw[t-1]))
        Cai[t] = (1 - α5)*α3*(Pi[t-1]-Tii[t-1]-Tai[t]+rGB*GBi[t-1])
        Ca[t] = Caw[t] + Cai[t]
        I[t] = max(0, min(((C[t]+Ca[t]+G[t])/(β1*Kf[t-1]) - uT)*Kf[t-1] + β2*Kf[t-1], β3*(Mf[t-1]-Lf[t-1])))
        Tv[t] = ϵ2*(C[t]+Ca[t]+G[t]+I[t])
        Tff[t] = max(0, ϵ3*(C[t]+Ca[t]+G[t]+I[t]-Wf[t]-Tv[t]-Taf[t]-rL*Lf[t-1]))
        Taw[t] = ϵ5*Kw[t-1] + ϵ8*(Mw[t-1]-Lw[t-1])
        Tai[t] = ϵ5*Ki[t-1] + ϵ8*(Mi[t-1]+Ei[t-1]+GBi[t-1])
        Taf[t] = ϵ6*Kf[t-1]
        Ta[t] = Taw[t] + Tai[t] + Taf[t]
        P[t] = C[t]+Ca[t]+G[t]+I[t]-Wf[t]-Tv[t]-Tff[t]-Taf[t]-rL*Lf[t-1]
        Pi[t] = (ζ1*(P[t]-I[t])+ζ2*(Mf[t-1]-Lf[t-1]))*Ei[t-1]/E[t-1]
        Pb[t] = (ζ1*(P[t]-I[t])+ζ2*(Mf[t-1]-Lf[t-1]))*Eb[t-1]/E[t-1]
        Pf[t] = P[t]-Pi[t]-Pb[t]
        IT[t] = θ1*Pb[t] + θ2*NLb[t-1]
        Tii[t] = ϵ4*(Pi[t]+IT[t]+rGB*GBi[t-1])
        Ti[t] = Tiw[t] + Tii[t]
        Tfb[t] = max(0, ϵ3*(-Wb[t]-Tcb[t]+Pb[t]+rL*L[t-1]+rGB*GBb[t-1]))
        Tf[t] = Tff[t] + Tfb[t]
        Sw[t] = -Cw[t]+W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]
        Si[t] = -Ci[t]-Tii[t]-Tai[t]-Tci[t]+Pi[t]+IT[t]+rGB*GBi[t-1]
        NLw[t] = -Caw[t]+Sw[t]
        NLi[t] = -Cai[t]+Si[t]
        NLf[t] = Pf[t] - I[t]
        NLb[t] = -Wb[t] - Tfb[t] - Tcb[t] + Pb[t] - IT[t] + rL*L[t-1] + rGB*GBb[t-1]
        NLg[t] = -G[t] - Wg[t] + Ti[t] + Tv[t] + Tf[t] + Ta[t] + Tc[t] - rGB*GB[t-1]
        Lw[t] = η1*(W[t] - Tiw[t] - Taw[t] - rL*Lw[t-1])
        ΔLw[t] = Lw[t] - Lw[t-1]
        Hw[t] = η2*Cw[t]
        ΔHw[t] = Hw[t] - Hw[t-1]
        ΔMw[t] = NLw[t] + ΔLw[t] - ΔHw[t]
        Mw[t] = Mw[t-1] + ΔMw[t]
        Vie[t] = (1-λV)*Vie[t-1] + λV*Vi[t-1]^2/(Vi[t-1]-ΔVi[t-1])
        Vbe[t] = (1-λV)*Vbe[t-1] + λV*Vb[t-1]^2/(Vb[t-1]-ΔVb[t-1])
        Δe[t] = η3*(I[t]-β2*Kf[t-1])/pe[t-1]
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
        Kf[t] = (1-β2)*Kf[t-1] + I[t]
        Kw[t] = (1-β4)*Kw[t-1] + Caw[t]
        Ki[t] = (1-β4)*Ki[t-1] + Cai[t]
        K[t] = Kf[t] + Kw[t] + Ki[t]
        NWw[t] = Kw[t] + Mw[t] - Lw[t] +Hw[t]
        NWi[t] = Ki[t] + Mi[t] + Ei[t] + GBi[t]
        NWf[t] = Mf[t] - Lf[t] - E[t] + Kf[t]
        NWb[t] = -M[t] + L[t] + Eb[t] + GBb[t] + Hb[t]
        NWg[t] = -GB[t] - H[t]
        NW[t] = K[t]
    end
end

run(2:N-40)

run(N-39:N)

function all_plot()
    plot(C[end-50:end], label="C")
    plot!(Ca[end-50:end], label="C")
    plot!(G[end-50:end], label="G")
    plot!(I[end-50:end], label="I")
    savefig("figs/Y.png")

    plot(C[end-50:end], label="C")
    plot!(Cw[end-50:end], label="Cw")
    plot!(Ci[end-50:end], label="Ci")
    plot!(Ca[end-50:end], label="Ca")
    plot!(Caw[end-50:end], label="Caw")
    plot!(Cai[end-50:end], label="Cai")
    savefig("figs/C.png")

    plot(Ti[end-50:end], label="Ti")
    plot!(Tiw[end-50:end], label="Tiw")
    plot!(Tii[end-50:end], label="Tii")
    savefig("figs/Ti.png")

    plot(Ta[end-50:end], label="Ta")
    plot!(Taw[end-50:end], label="Taw")
    plot!(Tai[end-50:end], label="Tai")
    plot!(Taf[end-50:end], label="Taf")
    savefig("figs/Ta.png")

    plot(Tf[end-50:end], label="Tf")
    plot!(Tfb[end-50:end], label="Tfb")
    plot!(Tff[end-50:end], label="Tff")
    savefig("figs/Tf.png")

    plot(Tc[end-50:end], label="Tc")
    plot!(Tcb[end-50:end], label="Tcb")
    plot!(Tci[end-50:end], label="Tci")
    savefig("figs/Tc.png")

    plot(Ti[end-50:end], label="Ti")
    plot!(Tv[end-50:end], label="Tv")
    plot!(Tf[end-50:end], label="Tf")
    plot!(Ta[end-50:end], label="Ta")
    plot!(Tc[end-50:end], label="Tc")
    savefig("figs/T.png")

    plot(W[end-50:end], label="W")
    plot!(Wf[end-50:end], label="Wf")
    plot!(Wb[end-50:end], label="Wb")
    plot!(Wg[end-50:end], label="Wg")
    savefig("figs/W.png")

    plot(IT[end-50:end], label="IT")
    plot!(P[end-50:end], label="P")
    plot!(Pb[end-50:end], label="Pb")
    plot!(Pi[end-50:end], label="Pi")
    plot!(Pf[end-50:end], label="Pf")
    savefig("figs/P_and_IT.png")

    plot(Mw[end-50:end], label="Mw")
    plot!(Mi[end-50:end], label="Mi")
    plot!(Mf[end-50:end], label="Mf")
    plot!(M[end-50:end], label="M")
    savefig("figs/M.png")

    plot(ΔMw[end-50:end], label="ΔMw")
    plot!(ΔMi[end-50:end], label="ΔMi")
    plot!(ΔMf[end-50:end], label="ΔMf")
    plot!(ΔM[end-50:end], label="ΔM")
    savefig("figs/ΔM.png")

    plot(e[end-50:end], label="e")
    plot!(ei[end-50:end], label="ei")
    plot!(eb[end-50:end], label="eb")
    plot!(zeros(51), label=nothing, color="Gray")
    savefig("figs/e.png")

    plot(Δe[end-50:end], label="Δe")
    plot!(Δei[end-50:end], label="Δei")
    plot!(Δeb[end-50:end], label="Δeb")
    plot!(zeros(51), label=nothing, color="Gray")
    savefig("figs/Δe.png")

    plot(pe[end-50:end], label="pe")
    plot!(zeros(51), label=nothing, color="Gray")
    savefig("figs/pe.png")

    plot(K[end-50:end], label="K")
    plot!(Kf[end-50:end], label="Kf")
    plot!(Ki[end-50:end], label="Ki")
    plot!(Kw[end-50:end], label="Kw")
    savefig("figs/K.png")

    plot(L[end-50:end], label="L")
    plot!(Lw[end-50:end], label="Lw")
    plot!(Lf[end-50:end], label="Lf")
    savefig("figs/L.png")

    plot(ΔL[end-50:end], label="ΔL")
    plot!(ΔLw[end-50:end], label="ΔLw")
    plot!(ΔLf[end-50:end], label="ΔLf")
    savefig("figs/ΔL.png")

    plot(H[end-50:end], label="H")
    plot!(Hw[end-50:end], label="Hw")
    plot!(Hb[end-50:end], label="Hb")
    savefig("figs/H.png")

    plot(ΔH[end-50:end], label="ΔH")
    plot!(ΔHw[end-50:end], label="ΔHw")
    plot!(ΔHb[end-50:end], label="ΔHb")
    savefig("figs/ΔH.png")

    plot(GB[end-50:end], label="GB")
    plot!(GBi[end-50:end], label="GBi")
    plot!(GBb[end-50:end], label="GBb")
    savefig("figs/GB.png")

    plot(ΔGB[end-50:end], label="ΔGB")
    plot!(ΔGBi[end-50:end], label="ΔGBi")
    plot!(ΔGBb[end-50:end], label="ΔGBb")
    savefig("figs/ΔGB.png")

    plot(NWw[end-50:end], label="NWw")
    plot!(NWi[end-50:end], label="NWi")
    plot!(NWf[end-50:end], label="NWf")
    plot!(NWb[end-50:end], label="NWb")
    plot!(NWg[end-50:end], label="NWg")
    savefig("figs/NW.png")

    plot(NLw[end-50:end], label="NLw")
    plot!(NLi[end-50:end], label="NLi")
    plot!(NLf[end-50:end], label="NLf")
    plot!(NLb[end-50:end], label="NLb")
    plot!(NLg[end-50:end], label="NLg")
    savefig("figs/NL.png")

    plot(((H+GB)./(C+Ca+G+Wg+I))[end-50:end], label="(H+GB)/GDP")
    plot!(zeros(51), label=nothing, color="Gray")
    savefig("figs/Gov-Debt-to-GDP ratio.png")
end
all_plot()