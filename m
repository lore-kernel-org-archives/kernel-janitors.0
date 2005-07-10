From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:54 +0000
Subject: [KJ] [PATCH 06/20] Fix "nocast type" warnings
Message-Id: <200507102318.54458.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/atm/fore200e.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/atm/fore200e.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/drivers/atm/fore200e.c
=================================--- linux-git.orig/drivers/atm/fore200e.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/drivers/atm/fore200e.c	2005-07-10 22:43:18.000000000 +0000
@@ -178,7 +178,7 @@
 
 
 static void*
-fore200e_kmalloc(int size, int flags)
+fore200e_kmalloc(int size, unsigned int __nocast flags)
 {
     void* chunk = kmalloc(size, flags);
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
