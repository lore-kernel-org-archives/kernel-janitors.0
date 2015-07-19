From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 Jul 2015 10:52:17 +0000
Subject: [patch 1/2 v2] Staging: rtl8192u: pointer math bug in ieee80211_rx_DELBA()
Message-Id: <20150719105217.GA8410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains because "delba" is a pointer to struct
rtl_80211_hdr_3addr so the "delba += sizeof(struct rtl_80211_hdr_3addr);"
is clearly wrong.  We are reading nonsense data from beyond the end of
the buffer and could oops if that memory isn't mapped.

It turns out the next two statements are also wrong. We should delete
the += sizeof() statement and "delba+2" should be "&delba->payload[2]".
"pReasonCode" isn't used so I deleted that.

With-Fix-From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first patch wasn't complete.

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
index 9ff8e05..d4215fd 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -571,7 +571,6 @@ int ieee80211_rx_DELBA(struct ieee80211_device *ieee, struct sk_buff *skb)
 {
 	 struct rtl_80211_hdr_3addr *delba = NULL;
 	PDELBA_PARAM_SET	pDelBaParamSet = NULL;
-	u16			*pReasonCode = NULL;
 	u8			*dst = NULL;
 
 	if (skb->len < sizeof(struct rtl_80211_hdr_3addr) + 6) {
@@ -592,9 +591,7 @@ int ieee80211_rx_DELBA(struct ieee80211_device *ieee, struct sk_buff *skb)
 	IEEE80211_DEBUG_DATA(IEEE80211_DL_DATA|IEEE80211_DL_BA, skb->data, skb->len);
 	delba = (struct rtl_80211_hdr_3addr *)skb->data;
 	dst = (u8 *)(&delba->addr2[0]);
-	delba += sizeof(struct rtl_80211_hdr_3addr);
-	pDelBaParamSet = (PDELBA_PARAM_SET)(delba+2);
-	pReasonCode = (u16 *)(delba+4);
+	pDelBaParamSet = (PDELBA_PARAM_SET)&delba->payload[2];
 
 	if(pDelBaParamSet->field.Initiator = 1)
 	{
