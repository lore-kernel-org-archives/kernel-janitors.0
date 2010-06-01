From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:08:55 +0000
Subject: [patch 1/2] caif: remove unneeded variable from caif_net_open()
Message-Id: <20100601070855.GD5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

We don't use the "ser" variable so I've removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
index 09257ca..f30a6a0 100644
--- a/drivers/net/caif/caif_serial.c
+++ b/drivers/net/caif/caif_serial.c
@@ -410,8 +410,6 @@ static void caifdev_setup(struct net_device *dev)
 
 static int caif_net_open(struct net_device *dev)
 {
-	struct ser_device *ser;
-	ser = netdev_priv(dev);
 	netif_wake_queue(dev);
 	return 0;
 }
