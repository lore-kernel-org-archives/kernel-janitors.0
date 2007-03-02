From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Fri, 02 Mar 2007 04:05:53 +0000
Subject: [KJ] [PATCH] lance.c: cleanup not needed cast
Message-Id: <20070302040553.GA6191@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed unnecessary cast.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

Index: linux-2.6.20.1/drivers/net/lance.c
=================================--- linux-2.6.20.1.orig/drivers/net/lance.c
+++ linux-2.6.20.1/drivers/net/lance.c
@@ -910,7 +910,7 @@ lance_restart(struct net_device *dev, un
 
 static void lance_tx_timeout (struct net_device *dev)
 {
-	struct lance_private *lp = (struct lance_private *) dev->priv;
+	struct lance_private *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 
 	outw (0, ioaddr + LANCE_ADDR);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
