From: Andreas Platschek <platschek@ict.tuwien.ac.at>
Date: Wed, 18 Jun 2014 18:16:09 +0000
Subject: [PATCH] Staging: rtl8192e prohibit deferencing of NULL pointer
Message-Id: <53A1D769.7090301@ict.tuwien.ac.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If ieee = NULL we jump to rx_dropped. Therefore we have to check again,
if ieee != NULL before we use it.

Signed-off-by: Andreas Platschek <platschek@ict.tuwien.ac.at>
---
 drivers/staging/rtl8192e/rtllib_rx.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c
b/drivers/staging/rtl8192e/rtllib_rx.c
index 60de54c..badf6e2 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1496,7 +1496,9 @@ int rtllib_rx(struct rtllib_device *ieee, struct
sk_buff *skb,
     return ret;
 
  rx_dropped:
-    ieee->stats.rx_dropped++;
+    if (ieee != NULL) {
+        ieee->stats.rx_dropped++;
+    }
     return 0;
 }
 EXPORT_SYMBOL(rtllib_rx);
-- 
1.7.10.4
