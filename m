From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jan 2020 17:39:24 +0000
Subject: [PATCH] rtw88: Use kfree_skb() instead of kfree()
Message-Id: <20200129173923.rfufhv5c5pxwodm6@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Chin-Yen Lee <timlee@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

sk_buff structs need to be freed with kfree_skb(), not kfree().

Fixes: b6c12908a33e ("rtw88: Add wowlan net-detect support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 243441453ead..5bdfc70c4529 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -745,7 +745,7 @@ static struct sk_buff *rtw_nlo_info_get(struct ieee80211_hw *hw)
 		loc  = rtw_get_rsvd_page_probe_req_location(rtwdev, ssid);
 		if (!loc) {
 			rtw_err(rtwdev, "failed to get probe req rsvd loc\n");
-			kfree(skb);
+			kfree_skb(skb);
 			return NULL;
 		}
 		nlo_hdr->location[i] = loc;
-- 
2.11.0
