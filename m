From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 03 Feb 2020 02:48:01 +0000
Subject: [PATCH net-next] rtw88: use kfree_skb() instead of kfree()
Message-Id: <20200203024801.177044-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Chin-Yen Lee <timlee@realtek.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kfree_skb() instead of kfree() to free sk_buff.

Fixes: b6c12908a33e ("rtw88: Add wowlan net-detect support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
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
