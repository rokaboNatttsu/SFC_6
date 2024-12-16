using StatsPlots

N=301

Cw, Ci, C, Caw, Cai, Ca, I, G = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
W, Wf, Wb, Wg = zeros(N), zeros(N), zeros(N), zeros(N)
Tiw, Tii, Ti, Tv, Tff, Tfb, Tf, Taw, Tai, Taf, Ta, Tci, Tcb, Tc = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
Pi, P, Pf, Pb, TDb, TDf, Sw, Si = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
NLw, NLi, NLf, NLb, NLg = zeros(N), zeros(N), zeros(N), zeros(N), zeros(N)
ΔMw, ΔMi, ΔMf, ΔM = zeros(N), zeros(N), zeros(N), zeros(N)
ΔLw, ΔLf, ΔL = zeros(N), zeros(N), zeros(N)
Δei, Δeb, Δe = zeros(N), zeros(N), zeros(N)
ΔEi, ΔEb, ΔE = zeros(N), zeros(N), zeros(N)
D, ΔD = zeros(N), zeros(N)
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
α1, α2, α3, α4, α5, α6 = 0.95, 0.05, 0.1, 0.9, 0.7, 0.01    # 0.95, 0.05, 0.1, 0.9, 0.7, 0.01
β1, β2, β3, β4, β5 = 1, 0.05, 1, 0.05, 0.05
γ = 0.02
δ = 0.68
ϵ1, ϵ2, ϵ3, ϵ4, ϵ5, ϵ6, ϵ7, ϵ8, ϵ9 = 0.2, 0.1, 0.2, 0.4, 0.03, 0.03, 0.2, 0.01, 0.02
ζ1, ζ2 = 0.3, 0.1
η1, η2, η3, η4, η5 = 5, 0.05, 1, 1, 0.01
θ1, θ2 = 0.05, 0.3
λV, λw = 0.5, 0.5
λ10, λ20, λ30, λ40 = 0.3, 0.3, 0.1, 0.3
λ11, λ12, λ13, λ14 = 1, -0.3, -0.3, -0.4
λ21, λ22, λ23, λ24 = -0.3, 1, -0.4, -0.3
λ31, λ32, λ33, λ34 = -0.3, -0.4, 1, -0.3
λ41, λ42, λ43, λ44 = -0.4, -0.3, -0.3, 1
λ50, λ60 = 0.5, 0.5
λ51, λ52 = 0.5, -0.5
λ61, λ62 = -0.5, 0.5
G0, Wg0 = 1,0.9
G[1], Wg[1], W[1] = G0, Wg0, Wg0
pe[1] = 1
Kf[1], K[1] = 6, 6
Mw[1], Mi[1], Mf[1], M[1] = 1,1,1,3
ei[1], eb[1], e[1] = 2,2,4
Ei[1], Eb[1], E[1] = pe[1]*ei[1], pe[1]*eb[1], pe[1]*e[1]
D[1] = 1
GBi[1], GBb[1], GB[1] = 1,1,2
Hb[1], H[1] = η5*M[1],η5*M[1]
NWw[1] = Mw[1] - Lw[1] + Hw[1]
NWi[1] = Mi[1] + Ei[1] + D[1] + GBi[1]
NWf[1] = Mf[1] - Lf[1] - E[1] + Kf[1]
NWb[1] = -M[1] + L[1] + Eb[1] - D[1] + GBb[1] + Hb[1]
NWg[1] = -GB[1] - H[1]
NW[1] = K[1]
Vi[1], Vb[1], Vie[1], Vbe[1] = Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1], Mi[1]+Ei[1]+GBi[1], Eb[1]+GBb[1]

function run(time_range::UnitRange)
    for t=time_range
        Wf[t] = (1-λw)*Wf[t-1] + λw*δ*(C[t-1]+Ca[t-1]+I[t-1]+G[t-1]-Tv[t-1]-Taf[t-1]-rL*Lf[t-1])
        Wb[t] = (1-λw)*Wb[t-1] + λw*δ*(-Tcb[t-1]+Pb[t-1]-TDb[t-1]+rL*L[t-1]+rGB*GBb[t-1])
        Wg[t] = Wg[t-1]*exp(γ)
        W[t] = Wf[t] + Wb[t] + Wg[t]
        Tiw[t] = ϵ1*W[t]
        Tci[t] = max(0, ϵ7*Δpe[t-1]*(ei[t-1]-Δei[t-1])+ϵ9*(Ei[t-1]+D[t-1]))
        Tcb[t] = max(0, ϵ7*Δpe[t-1]*(eb[t-1]-Δeb[t-1])+ϵ9*Eb[t-1])
        Tc[t] = Tci[t] + Tcb[t]
        Taw[t] = ϵ5*Kw[t-1] + ϵ8*(Mw[t-1]-Lw[t-1])
        Tai[t] = ϵ5*Ki[t-1] + ϵ8*(Mi[t-1]+Ei[t-1]+GBi[t-1])
        Taf[t] = ϵ6*Kf[t-1]
        Ta[t] = Taw[t] + Tai[t] + Taf[t]
        G[t] = G[t-1]*exp(γ)
        Cw[t] = α4*(α1*(W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]) + α2*(NWw[t-1]-Kw[t-1]))
        Ci[t] = α5*(α3*(Pi[t-1]+TDb[t-1]-Tii[t-1]-Tai[t-1]-Tci[t]+rGB*GBi[t-1])+α6*(Mi[t-1]+Ei[t-1]+D[t-1]+GBi[t-1]))
        C[t] = Cw[t] + Ci[t]
        Caw[t] = (1 - α4)*(α1*(W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]) + α2*(NWw[t-1]-Kw[t-1]))
        Cai[t] = (1 - α5)*(α3*(Pi[t-1]+TDb[t-1]-Tii[t-1]-Tai[t-1]-Tci[t]+rGB*GBi[t-1])+α6*(Mi[t-1]+Ei[t-1]+D[t-1]+GBi[t-1]))
        Ca[t] = Caw[t] + Cai[t]
        I[t] = max(0, min(β5*(Mf[t-1]-Lf[t-1])+((C[t]+Ca[t]+G[t])/(β1*Kf[t-1]) - uT)*Kf[t-1] + β2*Kf[t-1], β3*(Mf[t-1]-Lf[t-1])))
        Tv[t] = ϵ2*(C[t]+Ca[t]+G[t]+I[t])
        Tff[t] = max(0, ϵ3*(C[t]+Ca[t]+G[t]+I[t]-Wf[t]-Tv[t]-Taf[t]-rL*Lf[t-1]))
        P[t] = C[t]+Ca[t]+G[t]+I[t]-Wf[t]-Tv[t]-Tff[t]-Taf[t]-rL*Lf[t-1]
        TDf[t] = max(0, ζ1*(P[t]-I[t])+ζ2*(Mf[t-1]-Lf[t-1]))
        Pi[t] = TDf[t]*Ei[t-1]/E[t-1]
        Pb[t] = TDf[t]*Eb[t-1]/E[t-1]
        Pf[t] = P[t]-Pi[t]-Pb[t]
        TDb[t] = max(0, θ1*(-M[t-1]+L[t-1]+Eb[t-1]+GBb[t-1]+Hb[t-1]) + θ2*NLb[t-1])
        Tii[t] = ϵ4*(Pi[t]+TDb[t]+rGB*GBi[t-1])
        Ti[t] = Tiw[t] + Tii[t]
        Tfb[t] = max(0, ϵ3*(-Wb[t]-Tcb[t]+Pb[t]+rL*L[t-1]+rGB*GBb[t-1]))
        Tf[t] = Tff[t] + Tfb[t]
        Sw[t] = -Cw[t]+W[t]-Tiw[t]-Taw[t]-rL*Lw[t-1]
        Si[t] = -Ci[t]-Tii[t]-Tai[t]-Tci[t]+Pi[t]+TDb[t]+rGB*GBi[t-1]
        NLw[t] = -Caw[t]+Sw[t]
        NLi[t] = -Cai[t]+Si[t]
        NLf[t] = Pf[t] - I[t]
        NLb[t] = -Wb[t] - Tfb[t] - Tcb[t] + Pb[t] - TDb[t] + rL*L[t-1] + rGB*GBb[t-1]
        NLg[t] = -G[t] - Wg[t] + Ti[t] + Tv[t] + Tf[t] + Ta[t] + Tc[t] - rGB*GB[t-1]
        Lw[t] = max(0, η1*(W[t] - Tiw[t] - Taw[t] - rL*Lw[t-1]))
        ΔLw[t] = Lw[t] - Lw[t-1]
        Hw[t] = η2*Cw[t]
        ΔHw[t] = Hw[t] - Hw[t-1]
        ΔMw[t] = NLw[t] + ΔLw[t] - ΔHw[t]
        Mw[t] = Mw[t-1] + ΔMw[t]
        Vie[t] = (1-λV)*Vie[t-1] + λV*Vi[t-1]^2/(Vi[t-1]-ΔVi[t-1])
        Vbe[t] = (1-λV)*Vbe[t-1] + λV*Vb[t-1]^2/(Vb[t-1]-ΔVb[t-1])
        Δe[t] = η3*(I[t]-β2*Kf[t-1])/pe[t-1]
        e[t] = e[t-1] + Δe[t]
        Lf[t] = η4*(Wf[t]+Tv[t]+Tff[t]+Taf[t])
        ΔLf[t] = Lf[t] - Lf[t-1]
        ΔL[t] = ΔLw[t] + ΔLf[t]
        L[t] = L[t-1] + ΔL[t]
        ΔMf[t] = NLf[t] + ΔLf[t] + pe[t-1]*Δe[t]
        Mf[t] = Mf[t-1] + ΔMf[t]
        Mi[t] = (λ10 + λ12*TDf[t]/E[t-1] + λ13*TDb[t]/D[t-1] + λ14*rGB)*Vie[t]
        Eie[t] = (λ20 + λ22*TDf[t]/E[t-1] + λ23*TDb[t]/D[t-1] + λ24*rGB)*Vie[t]
        D[t] = (λ30 + λ32*TDf[t]/E[t-1] + λ33*TDb[t]/D[t-1] + λ34*rGB)*Vie[t]
        GBie[t] = (λ40 + λ42*TDf[t]/E[t-1] + λ43*TDb[t]/D[t-1] + λ44*rGB)*Vie[t]
        Ebe[t] = (λ50 + λ51*TDf[t]/E[t-1] + λ52*rGB)*Vbe[t]
        GBbe[t] = (λ60 + λ61*TDf[t]/E[t-1] + λ62*rGB)*Vbe[t]
        pe[t] = (Eie[t] + Ebe[t])/e[t]
        Δpe[t] = pe[t] - pe[t-1]
        ΔMi[t] = Mi[t] - Mi[t-1]
        ΔM[t] = ΔMw[t] + ΔMi[t] + ΔMf[t]
        M[t] = M[t-1] + ΔM[t]
        Hb[t] = η5*M[t]
        ΔHb[t] = Hb[t] - Hb[t-1]
        ΔH[t] = ΔHw[t] + ΔHb[t]
        H[t] = H[t-1] + ΔH[t]
        ΔGB[t] = -NLg[t] - ΔH[t]
        GB[t] = GB[t-1] + ΔGB[t]
        GBi[t] = GB[t]*GBie[t]/(GBie[t]+GBbe[t])
        GBb[t] = GB[t]*GBbe[t]/(GBie[t]+GBbe[t])
        ΔGBi[t] = GBi[t] - GBi[t-1]
        ΔGBb[t] = GBb[t] - GBb[t-1]
        Δei[t] = max(-ei[t-1], (NLi[t] - ΔMi[t] - ΔGBi[t])/pe[t-1])
        Δeb[t] = Δe[t] - Δei[t]
        ei[t] = ei[t-1] + Δei[t]
        eb[t] = eb[t-1] + Δeb[t]
        ΔEi[t] = Δpe[t]*ei[t] + pe[t-1]*Δei[t]
        ΔEb[t] = Δpe[t]*eb[t] + pe[t-1]*Δeb[t]
        Ei[t] = Ei[t-1] + ΔEi[t]
        Eb[t] = Eb[t-1] + ΔEb[t]
        ΔE[t] = ΔEi[t] + ΔEb[t]
        E[t] = E[t-1] + ΔE[t]
        Vi[t] = Mi[t] + Ei[t] + D[t] + GBi[t]
        Vb[t] = Eb[t] + GBb[t]
        ΔD[t] = D[t] - D[t-1]
        Kf[t] = (1-β2)*Kf[t-1] + I[t]
        Kw[t] = (1-β4)*Kw[t-1] + Caw[t]
        Ki[t] = (1-β4)*Ki[t-1] + Cai[t]
        K[t] = Kf[t] + Kw[t] + Ki[t]
        NWw[t] = Kw[t] + Mw[t] - Lw[t] +Hw[t]
        NWi[t] = Ki[t] + Mi[t] + Ei[t] + D[t] + GBi[t]
        NWf[t] = Mf[t] - Lf[t] - E[t] + Kf[t]
        NWb[t] = -M[t] + L[t] + Eb[t] - D[t] + GBb[t] + Hb[t]
        NWg[t] = -GB[t] - H[t]
        NW[t] = K[t]
    end
end

run(2:N) # 長期トレンドに収束させる。ついでにベースラインシナリオも計算
plot(-10:40, W[end-50:end], label="baseline", title="W")

#   ここでパラメータを変える
#rGB = 0.03 #   国債の利回りの増加
#ϵ5, ϵ8 = 0.05, 0.02 #   家計の資産税増税
#ϵ6 = 0.01  #    企業の資本への課税の増税
#ϵ1, ϵ4 = 0.3, 0.6  #  0.2,0.4 所得税増税
#ϵ2 = 0.05#   付加価値税増税
#ϵ3 = 0.1# 0.2  法人税増税
γ = 0.0#   政府支出増加率増加

run(N-40:N) # パラメータの変化に対する短期・中期・長期的影響をシミュレーションする
plot!(-10:40, W[end-50:end], label="control")

savefig("figs/W_diff.png")

function all_plot()
    plot(-10:40, C[end-50:end], label="C"  )
    plot!(-10:40, Ca[end-50:end], label="Ca"  )
    plot!(-10:40, I[end-50:end], label="I"  )
    plot!(-10:40, G[end-50:end], label="G"  )
    plot!(-10:40, Wg[end-50:end], label="Wg"  )
    savefig("figs/Y.png")

    plot(-10:40, C[end-50:end], label="C"  )
    plot!(-10:40, Cw[end-50:end], label="Cw"  )
    plot!(-10:40, Ci[end-50:end], label="Ci"  )
    plot!(-10:40, Ca[end-50:end], label="Ca"  )
    plot!(-10:40, Caw[end-50:end], label="Caw"  )
    plot!(-10:40, Cai[end-50:end], label="Cai"  )
    savefig("figs/C.png")

    plot(-10:40, Ti[end-50:end], label="Ti"  )
    plot!(-10:40, Tiw[end-50:end], label="Tiw"  )
    plot!(-10:40, Tii[end-50:end], label="Tii"  )
    savefig("figs/Ti.png")

    plot(-10:40, Ta[end-50:end], label="Ta"  )
    plot!(-10:40, Taw[end-50:end], label="Taw"  )
    plot!(-10:40, Tai[end-50:end], label="Tai"  )
    plot!(-10:40, Taf[end-50:end], label="Taf"  )
    savefig("figs/Ta.png")

    plot(-10:40, Tf[end-50:end], label="Tf"  )
    plot!(-10:40, Tfb[end-50:end], label="Tfb"  )
    plot!(-10:40, Tff[end-50:end], label="Tff"  )
    savefig("figs/Tf.png")

    plot(-10:40, Tc[end-50:end], label="Tc"  )
    plot!(-10:40, Tcb[end-50:end], label="Tcb"  )
    plot!(-10:40, Tci[end-50:end], label="Tci"  )
    savefig("figs/Tc.png")

    plot(-10:40, Ti[end-50:end], label="Ti"  )
    plot!(-10:40, Tv[end-50:end], label="Tv"  )
    plot!(-10:40, Tf[end-50:end], label="Tf"  )
    plot!(-10:40, Ta[end-50:end], label="Ta"  )
    plot!(-10:40, Tc[end-50:end], label="Tc"  )
    savefig("figs/T.png")

    plot(-10:40, W[end-50:end], label="W"  )
    plot!(-10:40, Wf[end-50:end], label="Wf"  )
    plot!(-10:40, Wb[end-50:end], label="Wb"  )
    plot!(-10:40, Wg[end-50:end], label="Wg"  )
    savefig("figs/W.png")

    plot(-10:40, TDb[end-50:end], label="TDb"  )
    plot!(-10:40, TDf[end-50:end], label="TDf"  )
    savefig("figs/TD.png")
    
    plot(-10:40, P[end-50:end], label="P"  )
    plot!(-10:40, Pb[end-50:end], label="Pb"  )
    plot!(-10:40, Pi[end-50:end], label="Pi"  )
    plot!(-10:40, Pf[end-50:end], label="Pf"  )
    savefig("figs/P.png")

    plot(-10:40, Mw[end-50:end], label="Mw"  )
    plot!(-10:40, Mi[end-50:end], label="Mi"  )
    plot!(-10:40, Mf[end-50:end], label="Mf"  )
    plot!(-10:40, M[end-50:end], label="M"  )
    savefig("figs/M.png")

    plot(-10:40, ΔMw[end-50:end], label="ΔMw")
    plot!(-10:40, ΔMi[end-50:end], label="ΔMi")
    plot!(-10:40, ΔMf[end-50:end], label="ΔMf")
    plot!(-10:40, ΔM[end-50:end], label="ΔM")
    savefig("figs/ΔM.png")

    plot(-10:40, e[end-50:end], label="e"  )
    plot!(-10:40, ei[end-50:end], label="ei"  )
    plot!(-10:40, eb[end-50:end], label="eb"  )
    savefig("figs/small_e.png")

    plot(-10:40, Δe[end-50:end], label="Δe")
    plot!(-10:40, Δei[end-50:end], label="Δei")
    plot!(-10:40, Δeb[end-50:end], label="Δeb")
    plot!(-10:40, zeros(51), label=nothing, color="Gray")
    savefig("figs/Δe.png")

    plot(-10:40, pe[end-50:end], label="pe"  )
    savefig("figs/pe.png")

    plot(-10:40, K[end-50:end], label="K"  )
    plot!(-10:40, Kf[end-50:end], label="Kf"  )
    plot!(-10:40, Ki[end-50:end], label="Ki"  )
    plot!(-10:40, Kw[end-50:end], label="Kw"  )
    savefig("figs/K.png")

    plot(-10:40, L[end-50:end], label="L"  )
    plot!(-10:40, Lw[end-50:end], label="Lw"  )
    plot!(-10:40, Lf[end-50:end], label="Lf"  )
    savefig("figs/L.png")

    plot(-10:40, E[end-50:end], label="E"  )
    plot!(-10:40, Ei[end-50:end], label="Ei"  )
    plot!(-10:40, Eb[end-50:end], label="Eb"  )
    plot!(-10:40, D[end-50:end], label="D"  )
    savefig("figs/E_and_D.png")

    plot(-10:40, ΔL[end-50:end], label="ΔL")
    plot!(-10:40, ΔLw[end-50:end], label="ΔLw")
    plot!(-10:40, ΔLf[end-50:end], label="ΔLf")
    plot!(-10:40, zeros(51), label=nothing, color="Gray")
    savefig("figs/ΔL.png")

    plot(-10:40, H[end-50:end], label="H"  )
    plot!(-10:40, Hw[end-50:end], label="Hw"  )
    plot!(-10:40, Hb[end-50:end], label="Hb"  )
    savefig("figs/H.png")

    plot(-10:40, ΔH[end-50:end], label="ΔH")
    plot!(-10:40, ΔHw[end-50:end], label="ΔHw")
    plot!(-10:40, ΔHb[end-50:end], label="ΔHb")
    plot!(-10:40, zeros(51), label=nothing)
    savefig("figs/ΔH.png")

    plot(-10:40, GB[end-50:end], label="GB"  )
    plot!(-10:40, GBi[end-50:end], label="GBi"  )
    plot!(-10:40, GBb[end-50:end], label="GBb"  )
    savefig("figs/GB.png")

    plot(-10:40, ΔGB[end-50:end], label="ΔGB")
    plot!(-10:40, ΔGBi[end-50:end], label="ΔGBi")
    plot!(-10:40, ΔGBb[end-50:end], label="ΔGBb")
    plot!(-10:40, zeros(51), label=nothing)
    savefig("figs/ΔGB.png")

    plot(-10:40, NWw[end-50:end], label="NWw")
    plot!(-10:40, NWi[end-50:end], label="NWi")
    plot!(-10:40, NWf[end-50:end], label="NWf")
    plot!(-10:40, NWb[end-50:end], label="NWb")
    plot!(-10:40, NWg[end-50:end], label="NWg")
    savefig("figs/NW.png")

    plot(-10:40, NLw[end-50:end], label="NLw")
    plot!(-10:40, NLi[end-50:end], label="NLi")
    plot!(-10:40, NLf[end-50:end], label="NLf")
    plot!(-10:40, NLb[end-50:end], label="NLb")
    plot!(-10:40, NLg[end-50:end], label="NLg")
    savefig("figs/NL.png")

    plot(-10:40, ((H+GB)./(C+Ca+G+Wg+I))[end-50:end], label="(H+GB)/GDP")
    savefig("figs/Gov-Debt-to-GDP ratio.png")
end
all_plot()