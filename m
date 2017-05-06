From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 06 May 2017 00:48:35 +0000
Subject: [PATCH] p54: allocate enough space for ->used_rxkeys
Message-Id: <20170506004835.a5awr4v5rba2pmu5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We have the number of longs, but we should be calculating the number of
bytes needed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intersil/p54/fwio.c b/drivers/net/wireless/intersil/p54/fwio.c
index 4ac6764f4897..3076f646c829 100644
--- a/drivers/net/wireless/intersil/p54/fwio.c
+++ b/drivers/net/wireless/intersil/p54/fwio.c
@@ -176,8 +176,9 @@ int p54_parse_firmware(struct ieee80211_hw *dev, const struct firmware *fw)
 		 * keeping a extra list for uploaded keys.
 		 */
 
-		priv->used_rxkeys = kzalloc(BITS_TO_LONGS(
-			priv->rx_keycache_size), GFP_KERNEL);
+		priv->used_rxkeys = kcalloc(BITS_TO_LONGS(priv->rx_keycache_size),
+					    sizeof(long),
+					    GFP_KERNEL);
 
 		if (!priv->used_rxkeys)
 			return -ENOMEM;
