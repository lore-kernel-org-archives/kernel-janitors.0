From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:51 +0000
Subject: [KJ] [PATCH 19/20] Fix "nocast type" warnings
Message-Id: <200507102320.51836.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/net/ns83820.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/net/ns83820.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/drivers/net/ns83820.c
=================================--- linux-git.orig/drivers/net/ns83820.c	2005-07-08 12:06:50.000000000 +0000
+++ linux-git/drivers/net/ns83820.c	2005-07-10 22:43:12.000000000 +0000
@@ -584,7 +584,7 @@
 	return 0;
 }
 
-static inline int rx_refill(struct net_device *ndev, int gfp)
+static inline int rx_refill(struct net_device *ndev, unsigned int __nocast gfp)
 {
 	struct ns83820 *dev = PRIV(ndev);
 	unsigned i;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
