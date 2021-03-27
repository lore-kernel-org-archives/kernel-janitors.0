Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA95BC433E3
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E850361A43
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhC0ASY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhC0ASR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:17 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3C4C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id m7so5476579qtq.11
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egqSSfF+LLpbB0crAVSBKLaC5C8YW9j6O7OazxKTlO4=;
        b=UWRVmbE0tiLJEbIaJgu5WlZJxChw50cvdTnbXpBsemwZclK/uwvcXFOiTRi3Y3hic0
         CyvAZwGtXIInGZ+6EjdbgGVwI+aVjVpLPrHjpdiD4wOZtiCz99ykD8fus8vP+DTctyL9
         NNSW/PLG5lbXo1lI0PCJ0B6LQ+QdCwm4rpYdACOXSYvBmR3oXjFRsR+PAfziFlP12SH+
         3bTEC3bDKCc9sAmJJlfHltOSZgW7GanXGq25BOWvXvgUN/YnDqZuRji07V7PqJOwD98A
         19wbkOAeLHF4DW69inIaDo1W6Z2HkKVHi6voHb7aZhaRZxfAVFxE74OrAluAK+C3/hOT
         Wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egqSSfF+LLpbB0crAVSBKLaC5C8YW9j6O7OazxKTlO4=;
        b=P/cm0aovX8yVUkv2FFEIUH41z4eKpjsqQZKmGNoEC3PSDK4L+8vz87AXTXl5AirYdj
         8CQf439RdfuU18i1rsEoG4ICs8lRJpivUTO0LcF6OeQNJUGmzLOaQhfBTowJYCkapAFf
         O9q0tLE2OX/sUN+q1d0SObBFpnIsTEYnW7OVf8I+1HNeinqpoKFN985Ivu8EvsZYzcS0
         iwqyX5iTqcqag7l03K5/f67fWmBWUugxsjJAIkNBPa3DcaL92GslksZfMXfbwVBd9QzT
         4tVQ1nqj8wgOjZNGryABAtdp1l6h0ffd1ixPgGJwttzmOYNQosrodQgKaVfV/ZPcpjAV
         niTg==
X-Gm-Message-State: AOAM532PgkT0cAqeJId2J6WnxyKjC4G465RouEGH0SAbjvIZNovVw3be
        XUMg2wJOUdptHDPWwyxtdkQI3Wii5eCwfqQr
X-Google-Smtp-Source: ABdhPJxOEPmBhtAmezXuedlBE/wiW6IFuz5WSeFv9V4i//EMQO3XQiCpOPkt15TX8s45hA+AmmE+IA==
X-Received: by 2002:ac8:1302:: with SMTP id e2mr14669061qtj.151.1616804296353;
        Fri, 26 Mar 2021 17:18:16 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:16 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 5/6] staging: rtl8723bs: mark some variables as __maybe_unused
Date:   Fri, 26 Mar 2021 18:17:35 -0600
Message-Id: <20210327001736.180881-5-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The definition of a few macros used in the code to write debug
messages could be empty depending on the way code is compiled.
If this is the case, there are compiler warnings about variables
not being used. This patch markes them to be __maybe_unused to
avoid these warnings.

Removing these warnings:

drivers/staging/rtl8723bs/core/rtw_mlme.c:1282:12: warning: variable ‘retry’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1065:17: warning: variable ‘reassoc’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1799:30: warning: variable ‘reason_code’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5411:21: warning: variable ‘psta’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6317:15: warning: variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_recv.c:2501:6: warning: variable ‘num_signal_qual’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1793:11: warning: variable ‘start_seq’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3719:32: warning: variable ‘ioted’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3719:20: warning: variable ‘masked’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3719:7: warning: variable ‘input_b’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4290:46: warning: variable ‘lowest_rate’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4290:34: warning: variable ‘hight_rate’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4290:21: warning: variable ‘curr_tx_sgi’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4290:7: warning: variable ‘curr_tx_rate’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4289:20: warning: variable ‘rate_mask2’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4289:8: warning: variable ‘rate_mask1’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/sdio_ops.c:170:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2924:7: warning: variable ‘ack’ set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:1199:6: warning: variable ‘reason’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 11 +++++++----
 drivers/staging/rtl8723bs/core/rtw_recv.c         |  2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  7 ++++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c    |  2 +-
 8 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 83fbd415d766..5125a7ec0198 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1277,7 +1277,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 /* define REJOIN */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
-	static u8 retry;
+	static u8 __maybe_unused retry;
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
 	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8aadcf72a7ba..4795d35bd99b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1062,7 +1062,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	reassoc, *p, *pos, *wpa_ie;
+	unsigned char *p, *pos, *wpa_ie;
+	unsigned char __maybe_unused reassoc;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char 	supportRate[16];
@@ -1796,7 +1797,8 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status;
+	unsigned short __maybe_unused reason_code = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -5408,7 +5410,7 @@ void _linked_info_dump(struct adapter *padapter)
 		} else if ((pmlmeinfo->state&0x03) == _HW_STATE_AP_) {
 			struct list_head	*phead, *plist;
 
-			struct sta_info *psta = NULL;
+			struct sta_info __maybe_unused *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
@@ -6314,7 +6316,8 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_code, evt_seq;
+	u8 evt_code;
+	u8 __maybe_unused evt_seq;
 	u16 evt_sz;
 	uint	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 608a59286505..9e6c229cae8d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2471,7 +2471,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 	u8 avg_signal_strength = 0;
 	u8 avg_signal_qual = 0;
 	u32 num_signal_strength = 0;
-	u32 num_signal_qual = 0;
+	u32 __maybe_unused num_signal_qual = 0;
 	u8 _alpha = 5; /*  this value is based on converging_constant = 5000 and sampling_interval = 1000 */
 
 	if (adapter->recvpriv.is_signal_dbg) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 760b0ea4e9bd..39f423ee4cf1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1787,7 +1787,8 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 {
 	struct sta_info *psta;
-	u16 tid, start_seq, param;
+	u16 tid, param;
+	u16 __maybe_unused start_seq;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct ADDBA_request *preq = (struct ADDBA_request *)paddba_req;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0081fe0a431f..1b54d8527823 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3716,7 +3716,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_BASIC_RATE:
 	{
 		struct mlme_ext_info *mlmext_info = &padapter->mlmeextpriv.mlmext_info;
-		u16 input_b = 0, masked = 0, ioted = 0, BrateCfg = 0;
+		u16 __maybe_unused input_b = 0, masked = 0, ioted = 0;
+		u16 BrateCfg = 0;
 		u16 rrsr_2g_force_mask = (RRSR_11M|RRSR_5_5M|RRSR_1M);
 		u16 rrsr_2g_allow_mask = (RRSR_24M|RRSR_12M|RRSR_6M|RRSR_CCK_RATES);
 
@@ -4286,8 +4287,8 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			u8 mac_id = *(u8 *)pval;
 			u32 cmd;
 			u32 ra_info1, ra_info2;
-			u32 rate_mask1, rate_mask2;
-			u8 curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
+			u32 __maybe_unused rate_mask1, rate_mask2;
+			u8 __maybe_unused curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
 
 			DBG_8192C("============ RA status check  Mac_id:%d ===================\n", mac_id);
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a24a39e70454..39328217a9c6 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -167,7 +167,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	u32 ftaddr;
 	u8 shift;
 	u32 val;
-	s32 err;
+	s32 __maybe_unused err;
 	__le32 le_tmp;
 
 	adapter = intfhdl->padapter;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 03a784558d79..c342fdebb6a7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2919,7 +2919,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	struct pkt_attrib	*pattrib;
 	unsigned char *pframe;
 	int ret = _FAIL;
-	bool ack = true;
+	bool __maybe_unused ack = true;
 	struct ieee80211_hdr *pwlanhdr;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 9909dece0b01..322a9393621e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1196,7 +1196,7 @@ static int rtw_wx_set_mlme(struct net_device *dev,
 			     union iwreq_data *wrqu, char *extra)
 {
 	int ret = 0;
-	u16 reason;
+	u16 __maybe_unused reason;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct iw_mlme *mlme = (struct iw_mlme *)extra;
 
-- 
2.30.2

