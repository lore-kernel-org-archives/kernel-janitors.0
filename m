From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 08:34:48 +0000
Subject: [patch] ath9k_htc: memory corruption calling set_bit()
Message-Id: <20150514083448.GC1665@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Sujith Manoharan <c_manoha@qca.qualcomm.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

In d8a2c51cdcae ('ath9k_htc: Use atomic operations for op_flags') we
changed things like this:

-	if (priv->op_flags & OP_TSF_RESET) {
+	if (test_bit(OP_TSF_RESET, &priv->op_flags)) {

The problem is that test_bit() takes a bit number and not a mask.  It
means that when we do:

	set_bit(OP_TSF_RESET, &priv->op_flags);

Then it sets the (1 << 6) bit instead of the 6 bit so we are setting a
bit which is past the end of the unsigned long.

Fixes: d8a2c51cdcae ('ath9k_htc: Use atomic operations for op_flags')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
OP_TSF_RESET seems to be a write-only bit.  Maybe we should just delete
it?

diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index e82a0d4..5dbc617 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -440,9 +440,9 @@ static inline void ath9k_htc_stop_btcoex(struct ath9k_htc_priv *priv)
 }
 #endif /* CONFIG_ATH9K_BTCOEX_SUPPORT */
 
-#define OP_BT_PRIORITY_DETECTED    BIT(3)
-#define OP_BT_SCAN                 BIT(4)
-#define OP_TSF_RESET               BIT(6)
+#define OP_BT_PRIORITY_DETECTED    3
+#define OP_BT_SCAN                 4
+#define OP_TSF_RESET               6
 
 enum htc_op_flags {
 	HTC_FWFLAG_NO_RMW,
