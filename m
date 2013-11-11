From: Marco Lavagnino <marco.lavagnino@gmail.com>
Date: Mon, 11 Nov 2013 02:01:51 +0000
Subject: [PATCH] various space fixes
Message-Id: <CA+1HSerVbdKzAoGFZ6YCTi+BrH+jC3JUo3yg6em1qJ9E-rq9Wg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes various warnings from empty spaces.

This is the first patch I submit, so I'm not completely sure if I'm
doing it right. If this is correct I might start submitting more
subtantial patches. If it is wrong, please tell me what did I do
wrong, so I can learn.

Signed-off-by: Marco S Lavagnino <marco.lavagnino@gmail.com>

--- rtw_cmd.c 2013-11-07 00:34:28.000000000 -0300
+++ rtw_cmd_patch.c 2013-11-10 22:23:15.825976151 -0300
@@ -32,7 +32,7 @@ Caller and the rtw_cmd_thread can protec
 No irqsave is necessary.
 */

-int _rtw_init_cmd_priv (struct cmd_priv *pcmdpriv)
+int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
  int res = _SUCCESS;

@@ -116,7 +116,7 @@ _func_enter_;
 _func_exit_;
 }

-void _rtw_free_cmd_priv (struct cmd_priv *pcmdpriv)
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 _func_enter_;

@@ -196,12 +196,12 @@ u32 rtw_init_cmd_priv(struct cmd_priv *p
 {
  u32 res;
 _func_enter_;
- res = _rtw_init_cmd_priv (pcmdpriv);
+ res = _rtw_init_cmd_priv(pcmdpriv);
 _func_exit_;
  return res;
 }

-u32 rtw_init_evt_priv (struct evt_priv *pevtpriv)
+u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
  int res;
 _func_enter_;
@@ -474,13 +474,11 @@ u8 rtw_sitesurvey_cmd(struct adapter  *p
  struct mlme_priv *pmlmepriv = &padapter->mlmepriv;

 _func_enter_;
- if (check_fwstate(pmlmepriv, _FW_LINKED) = true) {
+ if (check_fwstate(pmlmepriv, _FW_LINKED) = true)
  rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
- }

- if (check_fwstate(pmlmepriv, _FW_LINKED) = true) {
+ if (check_fwstate(pmlmepriv, _FW_LINKED) = true)
  p2p_ps_wk_cmd(padapter, P2P_PS_SCAN, 1);
- }

  ph2c = (struct cmd_obj *)rtw_zmalloc(sizeof(struct cmd_obj));
  if (ph2c = NULL)
@@ -800,7 +798,7 @@ _func_exit_;

 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct
cmd_obj *pcmd)
 {
- _func_enter_;
+_func_enter_;

  kfree(pcmd->parmbuf);
  kfree(pcmd);
@@ -812,7 +810,7 @@ _func_exit_;

 void rtw_readtssi_cmdrsp_callback(struct adapter *padapter,  struct
cmd_obj *pcmd)
 {
- _func_enter_;
+_func_enter_;

  kfree(pcmd->parmbuf);
  kfree(pcmd);
@@ -910,11 +908,10 @@ _func_enter_;

  rtw_led_control(padapter, LED_CTL_START_TO_LINK);

- if (pmlmepriv->assoc_ssid.SsidLength = 0) {
+ if (pmlmepriv->assoc_ssid.SsidLength = 0)
  RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, ("+Join cmd: Any SSid\n"));
- } else {
+ else
  RT_TRACE(_module_rtl871x_cmd_c_, _drv_notice_, ("+Join cmd: SSid
=[%s]\n", pmlmepriv->assoc_ssid.Ssid));
- }

  pcmd = (struct cmd_obj *)rtw_zmalloc(sizeof(struct cmd_obj));
  if (pcmd = NULL) {
@@ -995,9 +992,9 @@ _func_enter_;

  phtpriv->ht_option = false;
  if (pregistrypriv->ht_enable) {
- /* Added by Albert 2010/06/23 */
- /* For the WEP mode, we will use the bg mode to do the connection to
avoid some IOT issue. */
- /* Especially for Realtek 8192u SoftAP. */
+ /* Added by Albert 2010/06/23 */
+ /* For the WEP mode, we will use the bg mode to do the connection to
avoid some IOT issue. */
+ /* Especially for Realtek 8192u SoftAP. */
  if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
     (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
     (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
@@ -1280,7 +1277,7 @@ _func_enter_;
  goto exit;
  }

-/* init_h2fwcmd_w_parm_no_rsp(ph2c, psetrttblparm,
GEN_CMD_CODE(_SetRaTable)); */
+/* init_h2fwcmd_w_parm_no_rsp(ph2c, psetrttblparm,
GEN_CMD_CODE(_SetRaTable)); */

  _rtw_init_listhead(&ph2c->list);
  ph2c->cmdcode = GEN_CMD_CODE(_GetRaTable);
@@ -1341,7 +1338,7 @@ exit:
 _func_exit_;

  return res;
- }
+}

 u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 {
@@ -1746,7 +1743,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *p
 _func_enter_;

  /* if (!pwrctrlpriv->bLeisurePs) */
- /* return res; */
+ /* return res; */

  if (enqueue) {
  ph2c = (struct cmd_obj *)rtw_zmalloc(sizeof(struct cmd_obj));
@@ -1900,8 +1897,8 @@ _func_enter_;
  }

  pdrvextra_cmd_parm->ec_id = P2P_PROTO_WK_CID;
- pdrvextra_cmd_parm->type_size = intCmdType; /* As the command tppe. */
- pdrvextra_cmd_parm->pbuf = NULL; /* Must be NULL here */
+ pdrvextra_cmd_parm->type_size = intCmdType; /* As the command tppe. */
+ pdrvextra_cmd_parm->pbuf = NULL; /* Must be NULL here */

  init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
GEN_CMD_CODE(_Set_Drv_Extra));

@@ -2155,8 +2152,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *
  p2p_ps_wk_hdl(padapter, pdrvextra_cmd->type_size);
  break;
  case P2P_PROTO_WK_CID:
- /* Commented by Albert 2011/07/01 */
- /* I used the type_size as the type command */
+ /* Commented by Albert 2011/07/01 */
+ /* I used the type_size as the type command */
  p2p_protocol_wk_hdl(padapter, pdrvextra_cmd->type_size);
  break;
 #endif
@@ -2271,7 +2268,7 @@ _func_enter_;
  psta = rtw_alloc_stainfo(&padapter->stapriv, pnetwork->MacAddress);
  if (psta = NULL) {
  RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nCan't alloc sta_info
when createbss_cmd_callback\n"));
- goto createbss_cmd_fail ;
+ goto createbss_cmd_fail;
  }
  }
