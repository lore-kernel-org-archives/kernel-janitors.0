From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jan 2016 18:23:38 +0000
Subject: [PATCH 1/2] net-ath9k_htc: Delete an unnecessary variable initialisation in ath9k_hif_usb_rx_stream(
Message-Id: <5686C42A.5000405@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5686C390.5060600@users.sourceforge.net>
In-Reply-To: <5686C390.5060600@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ath9k-devel@lists.ath9k.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ath9k-devel@qca.qualcomm.com, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Jan 2016 19:00:53 +0100

Omit explicit initialisation at the beginning for one local variable
that is redefined before its first use.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/ath/ath9k/hif_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index 165dd20..51bd61b 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -525,7 +525,7 @@ static void ath9k_hif_usb_rx_stream(struct hif_device_usb *hif_dev,
 				    struct sk_buff *skb)
 {
 	struct sk_buff *nskb, *skb_pool[MAX_PKT_NUM_IN_TRANSFER];
-	int index = 0, i = 0, len = skb->len;
+	int index = 0, i, len = skb->len;
 	int rx_remain_len, rx_pkt_len;
 	u16 pool_index = 0;
 	u8 *ptr;
-- 
2.6.3

