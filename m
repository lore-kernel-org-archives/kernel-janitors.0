From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:47 +0000
Subject: [KJ] [PATCH 05/20] Fix "nocast type" warnings
Message-Id: <200507102318.47899.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/atm/ambassador.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/atm/ambassador.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletion(-)

Index: linux-git/drivers/atm/ambassador.c
=================================--- linux-git.orig/drivers/atm/ambassador.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/drivers/atm/ambassador.c	2005-07-10 22:43:20.000000000 +0000
@@ -794,7 +794,9 @@
     drain_rx_pool (dev, pool);
 }
 
-static inline void fill_rx_pool (amb_dev * dev, unsigned char pool, int priority) {
+static inline void fill_rx_pool (amb_dev * dev, unsigned char pool,
+                                 unsigned int __nocast priority)
+{
   rx_in rx;
   amb_rxq * rxq;
   

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
