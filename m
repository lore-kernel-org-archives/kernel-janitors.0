From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jul 2015 09:24:46 +0000
Subject: [patch 1/2] Staging: rtl8192u: pointer math bug in ieee80211_rx_DELBA()
Message-Id: <20150717092446.GB3060@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "delba" variable is a pointer to struct rtl_80211_hdr_3addr so this
addition here means we read nonsense data from beyond the end of the
buffer.  It could result in an oops if the memory is not mapped.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
index 9ff8e05..c1c1a1e 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -592,7 +592,7 @@ int ieee80211_rx_DELBA(struct ieee80211_device *ieee, struct sk_buff *skb)
 	IEEE80211_DEBUG_DATA(IEEE80211_DL_DATA|IEEE80211_DL_BA, skb->data, skb->len);
 	delba = (struct rtl_80211_hdr_3addr *)skb->data;
 	dst = (u8 *)(&delba->addr2[0]);
-	delba += sizeof(struct rtl_80211_hdr_3addr);
+	delba++;
 	pDelBaParamSet = (PDELBA_PARAM_SET)(delba+2);
 	pReasonCode = (u16 *)(delba+4);
 
