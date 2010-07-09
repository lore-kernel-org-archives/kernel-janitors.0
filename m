From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 09 Jul 2010 12:25:40 +0000
Subject: [PATCH 2/2] 82596: free resources on error
Message-Id: <1278678340-6889-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, =?UTF-8?q?Andr=C3=A9=20Goddard=20Rosa?= <andre.goddard@gmail.com>, netdev@vger.kernel.org

IRQ 56 was not freed anywhere (neither in i596_open() on error nor in
i596_close()), rx_bufs were not freed if init_i596_mem() fails,
netif_stop_queue() was not called.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/82596.c |   30 ++++++++++++++++++++++--------
 1 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/82596.c b/drivers/net/82596.c
index 73073d0..89e43d7 100644
--- a/drivers/net/82596.c
+++ b/drivers/net/82596.c
@@ -1015,24 +1015,35 @@ static int i596_open(struct net_device *dev)
 	}
 #ifdef ENABLE_MVME16x_NET
 	if (MACH_IS_MVME16x) {
-		if (request_irq(0x56, i596_error, 0, "i82596_error", dev))
-			return -EAGAIN;
+		if (request_irq(0x56, i596_error, 0, "i82596_error", dev)) {
+			res = -EAGAIN;
+			goto err_irq_dev;
+		}
 	}
 #endif
 	res = init_rx_bufs(dev);
-	if (res) {
-		free_irq(dev->irq, dev);
-		return res;
-	}
+	if (res)
+		goto err_irq_56;
 
 	netif_start_queue(dev);
 
-	/* Initialize the 82596 memory */
 	if (init_i596_mem(dev)) {
 		res = -EAGAIN;
-		free_irq(dev->irq, dev);
+		goto err_queue;
 	}
 
+	return 0;
+
+err_queue:
+	netif_stop_queue(dev);
+	remove_rx_bufs(dev);
+err_irq_56:
+#ifdef ENABLE_MVME16x_NET
+	free_irq(0x56, dev);
+#endif
+err_irq_dev:
+	free_irq(dev->irq, dev);
+
 	return res;
 }
 
@@ -1498,6 +1509,9 @@ static int i596_close(struct net_device *dev)
 	}
 #endif
 
+#ifdef ENABLE_MVME16x_NET
+	free_irq(0x56, dev);
+#endif
 	free_irq(dev->irq, dev);
 	remove_rx_bufs(dev);
 
-- 
1.7.0.4

