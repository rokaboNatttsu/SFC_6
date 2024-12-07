資産税（固定資産税や相続税）や、株式のキャピタルゲインへの税（ $\epsilon_xE+\epsilon_y\Delta p_e e_{-1}$ ）を追加したほうがリアルな挙動を示すかも。

- [TEM](#tem)
- [BSM](#bsm)
- [式一覧](#式一覧)
- [外生変数とパラメータ](#外生変数とパラメータ)
- [再現されるか確かめたい現象](#再現されるか確かめたい現象)
  - [GDP停滞中に債務残高対GDP比の推移](#gdp停滞中に債務残高対gdp比の推移)
    - [1990までと1990からの日本の様子を再現するか？](#1990までと1990からの日本の様子を再現するか)
  - [パラメータの値を変えると各種指標はどう変化するのか、プロット](#パラメータの値を変えると各種指標はどう変化するのかプロット)


# TEM
|                            |    労働者     |      投資家       |  企業(経常)   |   企業(資本)   |   民間金融機関    |     統合政府     | 合計 |
| :------------------------- | :-----------: | :---------------: | :-----------: | :------------: | :---------------: | :--------------: | :--: |
| 消費                       |    $-C_w$     |      $-C_i$       |     $+C$      |                |                   |                  | $0$  |
| 投資                       |               |                   |     $+I$      |      $-I$      |                   |                  | $0$  |
| 政府支出(公務員給与を除く) |               |                   |     $+G$      |                |                   |       $-G$       | $0$  |
| 賃金                       |     $+W$      |                   |    $-W_f$     |                |      $-W_b$       |      $-W_g$      | $0$  |
| 所得税                     |   $-T_{iw}$   |     $-T_{ii}$     |               |                |                   |      $+T_i$      | $0$  |
| 付加価値税                 |               |                   |    $-T_v$     |                |                   |      $+T_v$      | $0$  |
| 法人税                     |               |                   |   $-T_{ff}$   |                |     $-T_{fb}$     |      $+T_f$      | $0$  |
| 企業利潤                   |               |      $+P_i$       |     $-P$      |     $+P_f$     |      $+P_b$       |                  | $0$  |
| 金融機関から投資家への配当 |               |       $+S$        |               |                |       $-S$        |                  | $0$  |
| 借入金利払い               | $-r_LL_{w-1}$ |                   | $-r_LL_{f-1}$ |                |   $+r_LL_{-1}$    |                  | $0$  |
| 国債金利払い               |               | $+r_{GB}GB_{i-1}$ |               |                | $+r_{GB}GB_{b-1}$ | $-r_{GB}GB_{-1}$ | $0$  |
| [メモ:純貸出]              |  [ $NL_w$ ]   |     [$NL_i$]      |               |    [$NL_f$]    |     [$NL_b$]      |     [$NL_g$]     | $0$  |
| 預金の変化                 | $-\Delta M_w$ |   $-\Delta M_i$   |               | $-\Delta M_f$  |    $+\Delta M$    |                  | $0$  |
| 借入金の変化               | $+\Delta L_w$ |                   |               | $+\Delta L_f$  |    $-\Delta L$    |                  | $0$  |
| 株式純発行                 |               | $-p_e\Delta e_i$  |               | $+p_e\Delta e$ | $-p_e\Delta e_b$  |                  | $0$  |
| 国債の変化                 |               |  $-\Delta GB_i$   |               |                |  $-\Delta GB_b$   |   $+\Delta GB$   | $0$  |
| 現金の変化                 | $-\Delta H_w$ |                   |               |                |   $-\Delta H_b$   |   $+\Delta H$    | $0$  |
| 合計                       |      $0$      |        $0$        |      $0$      |      $0$       |        $0$        |       $0$        |      |


# BSM
|             | 労働者  | 資本家  |  企業   | 民間金融部門 | 統合政府 | 合計  |
| :---------- | :-----: | :-----: | :-----: | :----------: | :------: | :---: |
| 資本        |         |         |  $+K$   |              |          | $+K$  |
| 預金        | $+M_w$  | $+M_i$  | $+M_f$  |     $-M$     |          |  $0$  |
| 借入金      | $-L_w$  |         | $-L_f$  |     $+L$     |          |  $0$  |
| 株式/資本金 |         | $+E_i$  |  $-E$   |    $+E_b$    |          |  $0$  |
| 国債        |         | $+GB_i$ |         |   $+GB_b$    |  $-GB$   |  $0$  |
| 現金        | $+H_w$  |         |         |    $+H_b$    |   $-H$   |  $0$  |
| 純資産      | $-NW_w$ | $-NW_i$ | $-NW_f$ |   $-NW_b$    | $-NW_g$  | $-NW$ |
| 合計        |   $0$   |   $0$   |   $0$   |     $0$      |   $0$    | $0$ |

# 式一覧
上から順に計算する
$W_f=(1-\lambda_w)W_{f-1}+\lambda_w\delta(C_{-1}+I_{-1}+G_{-1})$
$W_b=(1-\lambda_w)W_{b-1}+\lambda_w\delta(P_{b-1}+r_LL_{-1}+r_{GB}GB_{b-1})$
$W_g=W_{g0}\exp(\gamma t)$
$W=W_f+W_b+W_g$
$T_{iw}=\epsilon_1 W$
$G=G_0\exp(\gamma t)$
$I=\max[0, \min\{(\frac{C+G}{\beta_1 K_{-1}}-u^T)K_{-1}+\beta_2K_{-1}, \beta_3(M_{f-1}-L_{f-1})\}]$
$C_w=\alpha_1(W-T_{iw}-r_LL_{w-1})+\alpha_2NW_{w-1}$
$C_i=\alpha_3(P_{i-1}-T_{ii-1}+r_{GB}GB_{i-1})$
$C=C_w+C_i$
$T_v=\epsilon_2(C+G+I)$
$T_{ff}=\max\{0,\epsilon_3(C+G+I-W_f-T_v-r_LL_{f-1})\}$
$P=C+G+I-W_f-T_v-T_{ff}-r_LL_{f-1}$
$P_i=\zeta(P-I)\frac{E_{i-1}}{E_{-1}}$
$P_b=\zeta(P-I)\frac{E_{b-1}}{E_{-1}}$
$P_f=P-P_i-P_b$
$S=\theta P_b$
$T_{ii}=\epsilon_4(P_i+S+r_{GB}GB_{i-1})$
$T_i=T_{iw}+T_{ii}$
$T_{fb}=\max\{0, \epsilon_3(-W_b+P_b+r_LL_{-1}+r_{GB}GB_{b-1})\}$
$T_f=T_{ff}+T_{fb}$
$NL_w=-C_w+W-T_{iw}-r_LL_{w-1}$
$NL_i=-C_i+P_i+S-T_{ii}+r_{GB}GB_{i-1}$
$NL_f=P_f-I$
$NL_b=-W_b-T_{fb}+P_b-S+r_LL_{-1}+r_{GB}GB_{b-1}$
$NL_g=-G-W_g+T_i+T_v+T_f-r_{GB}GB_{-1}$
$L_w=\eta_1(W-T_i)$
$\Delta L_w=L_w-L_{w-1}$
$H_w=\eta_2C_w$
$\Delta H_w=H_w-H_{w-1}$
$\Delta M_w=NL_w+\Delta L_w-\Delta H_w$
$M_w=M_{w-1}+\Delta M_w$
$V_i=M_i+E_i+GB_i$
$V_b=E_b+GB_b$
$V_i^e=(1-\lambda_V)V_{i-1}^e+\lambda_VV_{i-1}\frac{V_{i-1}}{V_{i-1}-\Delta V_{i-1}}$
$V_b^e=(1-\lambda_V)V_{b-1}^e+\lambda_VV_{b-1}\frac{V_{b-1}}{V_{b-1}-\Delta V_{b-1}}$
$Δe=\frac{\eta_3(I-\beta_2K_{-1})}{p_{e-1}}$
$e=e_{-1}+\Delta e$
$L_f=\max(0, (1+\eta_4)W-M_{f-1})$
$\Delta L_f=L_f-L_{f-1}$
$\Delta L=\Delta L_w+\Delta L_f$
$L=L_{-1}+\Delta L$
$\Delta M_f=NL_f+\Delta L_f$
$M_f=M_{f-1}+\Delta M_f$
$\begin{pmatrix}
  M_i \\
  E_i^e \\
  GB_i^e
\end{pmatrix}=
\begin{pmatrix}
  \lambda_{10} \\
  \lambda_{20} \\
  \lambda_{30}
\end{pmatrix}V_i^e+
\begin{pmatrix}
  \lambda_{11} & \lambda_{12} & \lambda_{13}\\
  \lambda_{21} & \lambda_{22} & \lambda_{23}\\
  \lambda_{31} & \lambda_{23} & \lambda_{33}
\end{pmatrix}
\begin{pmatrix}
  0 \\
  \frac{\zeta(P_{-1}-I_{-1})}{E_{-1}} \\
  r_{GB}
\end{pmatrix}V_i^e$
$\Delta M_i=M_i-M_{i-1}$
$\Delta M=\Delta M_w+\Delta M_i+\Delta M_f$
$M=M_{-1}+\Delta M$
$H_b=\eta_5M$
$\Delta H_b=H_b-H_{b-1}$
$\Delta H=\Delta H_w+\Delta H_b$
$H=H_{-1}+\Delta H$
$\Delta GB=-NL_g-\Delta H$
$\begin{pmatrix}
  E_b^e \\
  GB_b^e
\end{pmatrix}=
\begin{pmatrix}
  \lambda_{40} \\
  \lambda_{50}
\end{pmatrix}V_b^e+
\begin{pmatrix}
  \lambda_{41} & \lambda_{42}\\
  \lambda_{51} & \lambda_{52}
\end{pmatrix}
\begin{pmatrix}
  \frac{\zeta(P_{-1}-I_{-1})}{E_{-1}} \\
  r_{GB}
\end{pmatrix}V_b^e$
$GB_i=GB\frac{GB_i^e}{GB_i^e+GB_b^e}$
$GB_b=GB\frac{GB_b^e}{GB_i^e+GB_b^e}$
$\Delta GB_i=GB_i-GB_{i-1}$
$\Delta GB_b=GB_b-GB_{b-1}$
$p_e=\frac{E_i^e+E_b^e}{e}$
$\Delta p_e=p_e-p_{e-1}$
$Δe_i=\frac{1}{p_e}(NL_i-\Delta M_i-\Delta GB_i)$
$\Delta e_b=\Delta e-\Delta e_i$
$e_i=e_{i-1}+\Delta e_i$
$e_b=e_{b-1}+\Delta e_b$
$\Delta E_i=\Delta p_e e_{i-1}+p_e\Delta e_i$
$\Delta E_b=\Delta p_e e_{b-1}+p_e\Delta e_b$
$E_i=E_{i-1}+\Delta E_i$
$E_b=E_{b-1}+\Delta E_b$
$\Delta E=\Delta E_i+\Delta E_b$
$E=E_{-1}+\Delta E$
$K=(1-\beta_2)K_{-1}+I$
$NW_w=M_w-L_w+H_w$
$NW_i=M_i+E_i+GB_i$
$NW_f=M_f-L_f-E+K$
$NW_b=-M+L+E_b+GB_b+H_b$
$NW_g=-GB-H$
$NW=K$

隠れた恒等式として
$NL_b+\Delta M-\Delta L-p_e\Delta e_b-GB_b-H_b=0$
$\Delta E=\Delta p_e e_{-1}+p_e\Delta e$
$M=M_w+M_i+M_f$
$L=L_w+L_f$
$E=E_i+E_b$
$GB=GB_i+GB_b$
$H=H_w+H_b$
$NW=NW_w+NW_i+NW_f+NW_b+NW_g$

# 外生変数とパラメータ
$(\alpha_1, \alpha_2, \alpha_3)=(0.9, 0.05, 0.2)$
$(\beta_1, \beta_2, \beta_3)=(1,0.05,1)$
$\gamma=0.02$
$\delta=0.65$
$(\epsilon_1, \epsilon_2, \epsilon_3, \epsilon_4)=(0.3,0.1,0.2,0.2)$
$\zeta=0.3$
$(\eta_1,\eta_2,\eta_3,\eta_4,\eta_5)=(5,0.1,0.3,0.5,0.01)$
$\theta=0.3$
$(\lambda_V, \lambda_w)=(0.5, 0.5)$
$(\lambda_{10}, \lambda_{20}, \lambda_{30})=(0.3, 0.4, 0.3)$
$\begin{pmatrix}  \lambda_{11} & \lambda_{12} & \lambda_{13}\\  \lambda_{21} & \lambda_{22} & \lambda_{23}\\  \lambda_{31} & \lambda_{23} & \lambda_{33}\end{pmatrix}=\begin{pmatrix}  1 & -0.5 & -0.5\\  -0.5 & 1 & -0.5\\  -0.5 & -0.5 & 1\end{pmatrix}$
$(\lambda_{40}, \lambda_{50})=(0.5, 0.5)$
$\begin{pmatrix}  \lambda_{41} & \lambda_{42}\\  \lambda_{51} & \lambda_{52}\end{pmatrix}=\begin{pmatrix}  0.7 & -0.7\\  -0.7 & 0.7\end{pmatrix}$
$(r_L,r_{GB})=(0.01, 0.03)$
$u^T=0.7$

# 再現されるか確かめたい現象
## GDP停滞中に債務残高対GDP比の推移
### 1990までと1990からの日本の様子を再現するか？
まずは政府支出増加率を0.02程度にして名目GDPを成長させる

長期均衡が実現したあたりで政府支出を一定にして影響を見る

## パラメータの値を変えると各種指標はどう変化するのか、プロット


