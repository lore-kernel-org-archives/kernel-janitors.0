From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Nov 2015 10:01:20 +0000
Subject: [patch] ath9k_htc: check for underflow in ath9k_htc_rx_msg()
Message-Id: <20151106100120.GB18557@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

We check for overflow here, but we don't check for underflow so it
causes a static checker warning.

Fixes: fb9987d0f748 ('ath9k_htc: Support for AR9271 chipset.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/htc_hst.c b/drivers/net/wireless/ath/ath9k/htc_hst.c
index 2294709..fd85f996 100644
--- a/drivers/net/wireless/ath/ath9k/htc_hst.c
+++ b/drivers/net/wireless/ath/ath9k/htc_hst.c
@@ -414,7 +414,7 @@ void ath9k_htc_rx_msg(struct htc_target *htc_handle,
 		return;
 	}
 
-	if (epid >= ENDPOINT_MAX) {
+	if (epid < 0 || epid >= ENDPOINT_MAX) {
 		if (pipe_id != USB_REG_IN_PIPE)
 			dev_kfree_skb_any(skb);
 		else
