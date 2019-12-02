From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 17:42:46 +0000
Subject: [PATCH] i2400m/USB: fix error return when rx_size is too large
Message-Id: <20191202174246.77305-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky@linux.intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the rx_size is too large the intended error
-EINVAL is not being returned as this is being assigned to
result rather than rx_skb. Fix this be setting rx_skb
to ERR_PTR(-EINVAL) so that the error is returned in rx_skb
as originally intended.

Addresses-Coverity: ("Unused value")
Fixes: a8ebf98f5414 ("i2400m/USB: TX and RX path backends")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/usb-rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wimax/i2400m/usb-rx.c b/drivers/net/wimax/i2400m/usb-rx.c
index 5b64bda7d9e7..1a5e2178bb27 100644
--- a/drivers/net/wimax/i2400m/usb-rx.c
+++ b/drivers/net/wimax/i2400m/usb-rx.c
@@ -256,7 +256,7 @@ struct sk_buff *i2400mu_rx(struct i2400mu *i2400mu, struct sk_buff *rx_skb)
 			i2400mu->rx_size = rx_size;
 		else if (printk_ratelimit()) {
 			dev_err(dev, "BUG? rx_size up to %d\n", rx_size);
-			result = -EINVAL;
+			rx_skb = ERR_PTR(-EINVAL);
 			goto out;
 		}
 		skb_put(rx_skb, read_size);
-- 
2.24.0
