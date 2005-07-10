From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:15 +0000
Subject: [KJ] [PATCH 08/20] Fix "nocast type" warnings
Message-Id: <200507102319.16053.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/ieee1394/eth1394.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/ieee1394/eth1394.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/drivers/ieee1394/eth1394.c
=================================--- linux-git.orig/drivers/ieee1394/eth1394.c	2005-07-08 12:08:03.000000000 +0000
+++ linux-git/drivers/ieee1394/eth1394.c	2005-07-10 22:43:16.000000000 +0000
@@ -1632,7 +1632,7 @@
 /* Transmit a packet (called by kernel) */
 static int ether1394_tx (struct sk_buff *skb, struct net_device *dev)
 {
-	int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
+	unsigned int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
 	struct eth1394hdr *eth;
 	struct eth1394_priv *priv = netdev_priv(dev);
 	int proto;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
