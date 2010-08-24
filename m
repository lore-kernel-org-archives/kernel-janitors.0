From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 12:01:05 +0000
Subject: [patch] plip: remove superflous return
Message-Id: <20100824120105.GF29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

This return isn't reachable and it obscures the goto on the line before.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/plip.c b/drivers/net/plip.c
index ec0349e..7e82a82 100644
--- a/drivers/net/plip.c
+++ b/drivers/net/plip.c
@@ -1279,7 +1279,6 @@ static void plip_attach (struct parport *port)
 		if (!nl->pardev) {
 			printk(KERN_ERR "%s: parport_register failed\n", name);
 			goto err_free_dev;
-			return;
 		}
 
 		plip_init_netdev(dev);
