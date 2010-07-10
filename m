From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 13:11:47 +0000
Subject: [PATCH] atmel: unregister_netdev() on error
Message-Id: <1278767508-10164-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Simon Kelley <simon@thekelleys.org.uk>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org

We must unregister registered device if probe_atmel_card() fails.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/wireless/atmel.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/atmel.c b/drivers/net/wireless/atmel.c
index c8f7090..b9334a3 100644
--- a/drivers/net/wireless/atmel.c
+++ b/drivers/net/wireless/atmel.c
@@ -1626,7 +1626,7 @@ struct net_device *init_atmel_card(unsigned short irq, unsigned long port,
 
 	if (!probe_atmel_card(dev)) {
 		unregister_netdev(dev);
-		goto err_out_res;
+		goto err_out_unreg;
 	}
 
 	netif_carrier_off(dev);
@@ -1640,6 +1640,9 @@ struct net_device *init_atmel_card(unsigned short irq, unsigned long port,
 
 	return dev;
 
+err_out_unreg:
+	unregister_netdev(dev);
+
 err_out_res:
 	release_region(dev->base_addr, 32);
 err_out_irq:
-- 
1.7.0.4

