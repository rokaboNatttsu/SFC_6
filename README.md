
**閉鎖経済ではあるものの汎用的なSFCモデルを目指す**

- [TEM](#tem)
- [BSM](#bsm)
- [式一覧](#式一覧)
- [外生変数とパラメータ](#外生変数とパラメータ)
- [再現されるか確かめたい現象](#再現されるか確かめたい現象)
- [政策の変化に対してどう反応するか](#政策の変化に対してどう反応するか)


# TEM
|                              | 労働者(経常)  | 労働者(資本)  |   投資家(経常)    |     投資家(資本)     |  企業(経常)   |     企業(資本)     |     民間金融機関     |     統合政府     | 合計 |
| :--------------------------- | :-----------: | :-----------: | :---------------: | :------------------: | :-----------: | :----------------: | :------------------: | :--------------: | :--: |
| 流動消費                     |    $-C_w$     |               |      $-C_i$       |                      |     $+C$      |                    |                      |                  | $0$  |
| 消費財資産購入               |               |   $-C_{aw}$   |                   |      $-C_{ai}$       |    $+C_a$     |                    |                      |                  | $0$  |
| 投資                         |               |               |                   |                      |     $+I$      |        $-I$        |                      |                  | $0$  |
| 政府支出(公務員給与を除く)   |               |               |                   |                      |     $+G$      |                    |                      |       $-G$       | $0$  |
| 賃金                         |     $+W$      |               |                   |                      |    $-W_f$     |                    |        $-W_b$        |      $-W_g$      | $0$  |
| 所得税                       |   $-T_{iw}$   |               |     $-T_{ii}$     |                      |               |                    |                      |      $+T_i$      | $0$  |
| 付加価値税                   |               |               |                   |                      |    $-T_v$     |                    |                      |      $+T_v$      | $0$  |
| 法人税                       |               |               |                   |                      |   $-T_{ff}$   |                    |      $-T_{fb}$       |      $+T_f$      | $0$  |
| 資産税                       |   $-T_{aw}$   |               |     $-T_{ai}$     |                      |   $-T_{af}$   |                    |                      |      $+T_a$      | $0$  |
| 株式のキャピタルゲインへの税 |               |               |     $-T_{ci}$     |                      |               |                    |      $-T_{cb}$       |      $+T_c$      | $0$  |
| 企業利潤                     |               |               |      $+P_i$       |                      |     $-P$      |       $+P_f$       |        $+P_b$        |                  | $0$  |
| 金融機関から投資家への配当   |               |               |      $+TD_b$      |                      |               |                    |       $-TD_b$        |                  | $0$  |
| 借入金利払い                 | $-r_LL_{w-1}$ |               |                   |                      | $-r_LL_{f-1}$ |                    |     $+r_LL_{-1}$     |                  | $0$  |
| 国債金利払い                 |               |               | $+r_{GB}GB_{i-1}$ |                      |               |                    |  $+r_{GB}GB_{b-1}$   | $-r_{GB}GB_{-1}$ | $0$  |
| 労働者貯蓄                   |    $-S_w$     |    $+S_w$     |                   |                      |               |                    |                      |                  | $0$  |
| 投資家貯蓄                   |               |               |      $-S_i$       |        $+S_i$        |               |                    |                      |                  | $0$  |
| [メモ:純貸出]                |               |  [ $NL_w$ ]   |                   |       [$NL_i$]       |               |      [$NL_f$]      |       [$NL_b$]       |     [$NL_g$]     | $0$  |
| 預金の変化                   |               | $-\Delta M_w$ |                   |    $-\Delta M_i$     |               |   $-\Delta M_f$    |     $+\Delta M$      |                  | $0$  |
| 借入金の変化                 |               | $+\Delta L_w$ |                   |                      |               |   $+\Delta L_f$    |     $-\Delta L$      |                  | $0$  |
| 株式純発行                   |               |               |                   | $-p_{e-1}\Delta e_i$ |               | $+p_{e-1}\Delta e$ | $-p_{e-1}\Delta e_b$ |                  | $0$  |
| 国債の変化                   |               |               |                   |    $-\Delta GB_i$    |               |                    |    $-\Delta GB_b$    |   $+\Delta GB$   | $0$  |
| 現金の変化                   |               | $-\Delta H_w$ |                   |                      |               |                    |    $-\Delta H_b$     |   $+\Delta H$    | $0$  |
| 合計                         |      $0$      |      $0$      |        $0$        |         $0$          |      $0$      |        $0$         |         $0$          |       $0$        |      |


# BSM
|                    | 労働者  |     資本家      |  企業   | 民間金融部門 | 統合政府 | 合計  |
| :----------------- | :-----: | :-------------: | :-----: | :----------: | :------: | :---: |
| 資本               | $+K_w$  |     $+K_i$      | $+K_f$  |              |          | $+K$  |
| 預金               | $+M_w$  |     $+M_i$      | $+M_f$  |     $-M$     |          |  $0$  |
| 借入金             | $-L_w$  |                 | $-L_f$  |     $+L$     |          |  $0$  |
| 企業の株式         |         |     $+E_i$      |  $-E$   |    $+E_b$    |          |  $0$  |
| 民間金融機関の株式 |         | $+D$ |         | $-D$ |          |  $0$  |
| 国債               |         |     $+GB_i$     |         |   $+GB_b$    |  $-GB$   |  $0$  |
| 現金               | $+H_w$  |                 |         |    $+H_b$    |   $-H$   |  $0$  |
| 純資産             | $-NW_w$ |     $-NW_i$     | $-NW_f$ |   $-NW_b$    | $-NW_g$  | $-NW$ |
| 合計               |   $0$   |       $0$       |   $0$   |     $0$      |   $0$    |  $0$  |

# 式一覧
上から順に計算する

- $W_f=(1-\lambda_w)W_{f-1}+\lambda_w\delta(C_{-1}+C_{a-1}+I_{-1}+G_{-1}-T_{v-1}-T_{af-1}-r_LL_{f-1})$
- $W_b=(1-\lambda_w)W_{b-1}+\lambda_w\delta(-T_{cb-1}+P_{b-1}-TD_{b-1}+r_LL_{-1}+r_{GB}GB_{b-1})$
- $W_g=W_{g0}\exp(\gamma t)$
- $W=W_f+W_b+W_g$
- $T_{iw}=\epsilon_1 W$
- $T_{ci}=\max\{0, \epsilon_7\Delta p_{e-1}(e_{i-1}-\Delta e_{i-1})+\epsilon_9(E_{i-1}+D_{-1})\}$
- $T_{cb}=\max\{0, \epsilon_7\Delta p_{e-1}(e_{b-1}-\Delta e_{b-1})+\epsilon_9E_{b-1}\}$
- $T_c=T_{ci}+T_{cb}$
- $T_{aw}=\epsilon_5K_{w-1} + \epsilon_8(M_{w-1}-L_{i-1})$
- $T_{ai}=\epsilon_5K_{i-1} + \epsilon_8(M_{i-1}+E_{i-1}+GB_{i-1})$
- $T_{af}=\epsilon_6K_{f-1}$
- $T_a=T_{aw}+T_{ai}+T_{af}$
- $G=G_0\exp(\gamma t)$
- $C_w=\alpha_4\{\alpha_1(W-T_{iw}-T_{aw}-r_LL_{w-1})+\alpha_2(NW_{w-1}-K_{w-1})\}$
- $C_i=\alpha_5\{\alpha_3(P_{i-1}+TD_{b-1}-T_{ii-1}-T_{ai-1}-T_{ci}+r_{GB}GB_{i-1})+\alpha_6(M_{i-1}+E_{i-1}+D_{-1}+GB_{i-1})\}$
- $C=C_w+C_i$
- $C_{aw}=(1-\alpha_4)\{\alpha_1(W-T_{iw}-T_{aw}-r_LL_{w-1})+\alpha_2(NW_{w-1}-K_{w-1})\}$
- $C_{ai}=(1-\alpha_5)\{\alpha_3(P_{i-1}+TD_{b-1}-T_{ii-1}-T_{ai-1}-T_{ci}+r_{GB}GB_{i-1})+\alpha_6(M_{i-1}+E_{i-1}+D_{-1}+GB_{i-1})\}$
- $C_a=C_{aw}+C_{ai}$
- $I=\max[0, \min\{(\frac{C+C_a+G}{\beta_1 K_{f-1}}-u^T)K_{f-1}+\beta_2K_{f-1}, \beta_3(M_{f-1}-L_{f-1})\}]$
- $T_v=\epsilon_2(C+C_a+G+I)$
- $T_{ff}=\max\{0,\epsilon_3(C+C_a+G+I-W_f-T_v-T_{af}-r_LL_{f-1})\}$
- $P=C+C_a+G+I-W_f-T_v-T_{ff}-T_{af}-r_LL_{f-1}$
- $TD_f = \max\{0, \zeta_1(P-I)+\zeta_2(M_{f-1}-L_{f-1})\}$
- $P_i=TD_f\frac{E_{i-1}}{E_{-1}}$
- $P_b=TD_f\frac{E_{b-1}}{E_{-1}}$
- $P_f=P-P_i-P_b$
- $TD_b=\max\{0, \theta_1 (-M_{-1}+L_{-1}+E_{b-1}+GB_{b-1}+H_{b-1})+ \theta_2 NL_{b-1}\}$
- $T_{ii}=\epsilon_4(P_i+TD_b+r_{GB}GB_{i-1})$
- $T_i=T_{iw}+T_{ii}$
- $T_{fb}=\max\{0, \epsilon_3(-W_b+P_b+r_LL_{-1}+r_{GB}GB_{b-1})\}$
- $T_f=T_{ff}+T_{fb}$
- $S_w=-C_w+W-T_{iw}-T_{aw}-r_LL_{w-1}$
- $S_i=-C_i-T_{ii}-T_{ai}-T_{ci}+P_i+TD_b+r_{GB}GB_{i-1}$
- $NL_w=-C_{aw}+S_w$
- $NL_i=-C_{ai}+S_i$
- $NL_f=P_f-I$
- $NL_b=-W_b-T_{fb}-T_{cb}+P_b-TD_b+r_LL_{-1}+r_{GB}GB_{b-1}$
- $NL_g=-G-W_g+T_i+T_v+T_f+T_a+T_c-r_{GB}GB_{-1}$
- $L_w=\max\{\eta_1(W-T_{iw}-T_{aw}-r_LL_{w-1})\}$
- $\Delta L_w=L_w-L_{w-1}$
- $H_w=\eta_2C_w$
- $\Delta H_w=H_w-H_{w-1}$
- $\Delta M_w=NL_w+\Delta L_w-\Delta H_w$
- $M_w=M_{w-1}+\Delta M_w$
- $V_i^e=(1-\lambda_V)V_{i-1}^e+\lambda_VV_{i-1}\frac{V_{i-1}}{V_{i-1}-\Delta V_{i-1}}$
- $V_b^e=(1-\lambda_V)V_{b-1}^e+\lambda_VV_{b-1}\frac{V_{b-1}}{V_{b-1}-\Delta V_{b-1}}$
- $\Delta e=\frac{\eta_3(I-\beta_2K_{f-1})}{p_{e-1}}$
- $e=e_{-1}+\Delta e$
- $L_f=\max(0, (1+\eta_4)W-M_{f-1})$
- $\Delta L_f=L_f-L_{f-1}$
- $\Delta L=\Delta L_w+\Delta L_f$
- $L=L_{-1}+\Delta L$
- $\Delta M_f=NL_f+\Delta L_f+p_{e-1}\Delta e$
- $M_f=M_{f-1}+\Delta M_f$

$$
\begin{pmatrix}
  M_i \\
  E_i^e \\
  D \\
  GB_i^e
\end{pmatrix}=
\begin{pmatrix}
  \lambda_{10} \\
  \lambda_{20} \\
  \lambda_{30} \\
  \lambda_{40}
\end{pmatrix}V_i^e+
\begin{pmatrix}
  \lambda_{11} & \lambda_{12} & \lambda_{13} & \lambda_{14}\\
  \lambda_{21} & \lambda_{22} & \lambda_{23} & \lambda_{24}\\
  \lambda_{31} & \lambda_{23} & \lambda_{33} & \lambda_{34}\\
  \lambda_{41} & \lambda_{43} & \lambda_{43} & \lambda_{44}
\end{pmatrix}
\begin{pmatrix}
  0 \\
  \frac{TD_f}{E_{-1}} \\
  \frac{TD_b}{D_{-1}}\\
  r_{GB}
\end{pmatrix}V_i^e
$$

$$
\begin{pmatrix}
  E_b^e \\
  GB_b^e
\end{pmatrix}=
\begin{pmatrix}
  \lambda_{50} \\
  \lambda_{60}
\end{pmatrix}V_b^e+
\begin{pmatrix}
  \lambda_{51} & \lambda_{52}\\
  \lambda_{61} & \lambda_{62}
\end{pmatrix}
\begin{pmatrix}
  \frac{TD_f}{E_{-1}} \\
  r_{GB}
\end{pmatrix}V_b^e
$$

- $p_e=\frac{E_i^e+E_b^e}{e}$
- $\Delta p_e = p_e-p_{e-1}$
- $\Delta M_i=M_i-M_{i-1}$
- $\Delta M=\Delta M_w+\Delta M_i+\Delta M_f$
- $M=M_{-1}+\Delta M$
- $H_b=\eta_5M$
- $\Delta H_b=H_b-H_{b-1}$
- $\Delta H=\Delta H_w+\Delta H_b$
- $H=H_{-1}+\Delta H$
- $\Delta GB=-NL_g-\Delta H$
- $GB=GB_{-1}+\Delta GB$
- $GB_i=GB\frac{GB_i^e}{GB_i^e+GB_b^e}$
- $GB_b=GB\frac{GB_b^e}{GB_i^e+GB_b^e}$
- $\Delta GB_i=GB_i-GB_{i-1}$
- $\Delta GB_b=GB_b-GB_{b-1}$
- $\Delta e_i=\frac{1}{p_{e-1}}(NL_i-\Delta M_i-\Delta GB_i)$
- $\Delta e_b=\Delta e-\Delta e_b$
- $e_i=e_{i-1}+\Delta e_i$
- $e_b=e_{b-1}+\Delta e_b$
- $\Delta E_i=\Delta p_e e_i+p_{e-1}\Delta e_i$
- $\Delta E_b=\Delta p_e e_b+p_{e-1}\Delta e_b$
- $E_i=E_{i-1}+\Delta E_i$
- $E_b=E_{b-1}+\Delta E_b$
- $\Delta E=\Delta E_i+\Delta E_b$
- $E=E_{-1}+\Delta E$
- $V_i=M_i+E_i+D+GB_i$
- $V_b=E_b+GB_b$
- $\Delta D = D-D_{-1}$
- $K_f=(1-\beta_2)K_{f-1}+I$
- $K_w=(1-\beta_4)K_{w-1}+C_{aw}$
- $K_i=(1-\beta_4)K_{i-1}+C_{ai}$
- $K=K_w+K_i+K_f$
- $NW_w=K_w+M_w-L_w+H_w$
- $NW_i=K_i+M_i+E_i+D+GB_i$
- $NW_f=M_f-L_f-E+K_f$
- $NW_b=-M+L+E_b-D+GB_b+H_b$
- $NW_g=-GB-H$
- $NW=K$

隠れた恒等式として
- $NL_b+\Delta M-\Delta L-p_{e-1}\Delta e_b-\Delta GB_b-\Delta H_b=0$
- $\Delta E=\Delta p_e e+p_{e-1}\Delta e$
- $M=M_w+M_i+M_f$
- $L=L_w+L_f$
- $E=E_i+E_b$
- $GB=GB_i+GB_b$
- $H=H_w+H_b$
- $NW=NW_w+NW_i+NW_f+NW_b+NW_g$

# 外生変数とパラメータ
- $(\alpha_1, \alpha_2, \alpha_3, \alpha_4, \alpha_5, \alpha_6)=(0.9, 0.05, 0.2, 0.9, 0.7, 0.01)$
- $(\beta_1, \beta_2, \beta_3, \beta_4)=(1,0.05,1, 0.05)$
- $\gamma=0.02$
- $\delta=0.65$
- $(\epsilon_1, \epsilon_2, \epsilon_3, \epsilon_4, \epsilon_5, \epsilon_6, \epsilon_7, \epsilon_8, \epsilon_9)=(0.3,0.1,0.2,0.2, 0.03, 0.03, 0.2, 0.01, 0.02)$
- $\zeta_1, \zeta_2 =0.3, 0.05$
- $(\eta_1,\eta_2,\eta_3,\eta_4,\eta_5)=(5,0.05,1,1,0.01)$
- $(\theta_1, \theta_2)=(0.05, 0.3)$
- $(\lambda_V, \lambda_w)=(0.5, 0.5)$
- $(\lambda_{10}, \lambda_{20}, \lambda_{30}, \lambda_{40})=(0.3, 0.3, 0.1, 0.3)$

$$
\begin{pmatrix}
  \lambda_{11} & \lambda_{12} & \lambda_{13} & \lambda_{14}\\
  \lambda_{21} & \lambda_{22} & \lambda_{23} & \lambda_{24}\\
  \lambda_{31} & \lambda_{23} & \lambda_{33} & \lambda_{34}\\
  \lambda_{41} & \lambda_{43} & \lambda_{43} & \lambda_{44}
\end{pmatrix}=
\begin{pmatrix}
  1 & -0.3 & -0.3 & -0.4\\
  -0.3 & 1 & -0.4 & -0.3\\
  -0.3 & -0.4 & 1 & -0.3\\
  -0.4 & -0.3 & -0.3 & 1
\end{pmatrix}
$$

- $(\lambda_{40}, \lambda_{50})=(0.5, 0.5)$

$$
\begin{pmatrix}
  \lambda_{41} & \lambda_{42}\\
  \lambda_{51} & \lambda_{52}
\end{pmatrix}=
\begin{pmatrix}
  0.5 & -0.5\\
  -0.5 & 0.5
\end{pmatrix}
$$

- $(r_L,r_{GB})=(0.01, 0.02)$
- $u^T=0.8$

# 再現されるか確かめたい現象

# 政策の変化に対してどう反応するか
税率と、政府の支出（企業への支払いと公務員給与）の変化率を動かしたとき、各種内生変数はどのように反応するのか


