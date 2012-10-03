From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 06:06:31 +0000
Subject: [patch 2/3] brcmfmac: fix end of loop check (signedness bug)
Message-Id: <20121003060631.GB3802@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

The problem here is that we loop until "remained_buf_len" is less than
zero, but since it is unsigned, it never is.

"remained_buf_len" has to be large enough to hold the value from
"mgmt_ie_buf_len".  That variable is type u32, but it only holds small
values so I have changed to both variables to int.

Also I removed the bogus initialization from "mgmt_ie_buf_len" so that
GCC can detect if it is used unitialized.  I moved the declaration of
"remained_buf_len" closer to where it is used so it's easier to read.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
index c1abaa6..ed83b54 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
@@ -3972,7 +3972,7 @@ brcmf_set_management_ie(struct brcmf_cfg80211_info *cfg,
 	u8  *iovar_ie_buf;
 	u8  *curr_ie_buf;
 	u8  *mgmt_ie_buf = NULL;
-	u32 mgmt_ie_buf_len = 0;
+	int mgmt_ie_buf_len;
 	u32 *mgmt_ie_len = 0;
 	u32 del_add_ie_buf_len = 0;
 	u32 total_ie_buf_len = 0;
@@ -3982,7 +3982,6 @@ brcmf_set_management_ie(struct brcmf_cfg80211_info *cfg,
 	struct parsed_vndr_ie_info *vndrie_info;
 	s32 i;
 	u8 *ptr;
-	u32 remained_buf_len;
 
 	WL_TRACE("bssidx %d, pktflag : 0x%02X\n", bssidx, pktflag);
 	iovar_ie_buf = kzalloc(WL_EXTRA_BUF_MAX, GFP_KERNEL);
@@ -3995,8 +3994,7 @@ brcmf_set_management_ie(struct brcmf_cfg80211_info *cfg,
 		case VNDR_IE_PRBRSP_FLAG:
 			mgmt_ie_buf = cfg->ap_info->probe_res_ie;
 			mgmt_ie_len = &cfg->ap_info->probe_res_ie_len;
-			mgmt_ie_buf_len -				sizeof(cfg->ap_info->probe_res_ie);
+			mgmt_ie_buf_len = sizeof(cfg->ap_info->probe_res_ie);
 			break;
 		case VNDR_IE_BEACON_FLAG:
 			mgmt_ie_buf = cfg->ap_info->beacon_ie;
@@ -4067,8 +4065,9 @@ brcmf_set_management_ie(struct brcmf_cfg80211_info *cfg,
 	*mgmt_ie_len = 0;
 	/* Add if there is any extra IE */
 	if (mgmt_ie_buf && parsed_ie_buf_len) {
-		ptr = mgmt_ie_buf;
+		int remained_buf_len;
 
+		ptr = mgmt_ie_buf;
 		remained_buf_len = mgmt_ie_buf_len;
 
 		/* make a command to add new ie */
