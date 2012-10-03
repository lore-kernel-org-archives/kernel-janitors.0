From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 06:07:13 +0000
Subject: [patch 3/3] brcmfmac: Using zero instead of NULL
Message-Id: <20121003060713.GC3802@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

Sparse complains that we use zero instead of NULL here.  In fact, the
initialization is wrong and should be removed.  Doing these kinds of
bogus initializations means that GCC can't detect unitialized variables
and leads to bugs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
index ed83b54..9ddafc2 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
@@ -3973,7 +3973,7 @@ brcmf_set_management_ie(struct brcmf_cfg80211_info *cfg,
 	u8  *curr_ie_buf;
 	u8  *mgmt_ie_buf = NULL;
 	int mgmt_ie_buf_len;
-	u32 *mgmt_ie_len = 0;
+	u32 *mgmt_ie_len;
 	u32 del_add_ie_buf_len = 0;
 	u32 total_ie_buf_len = 0;
 	u32 parsed_ie_buf_len = 0;
