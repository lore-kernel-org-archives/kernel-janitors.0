From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sun, 01 Oct 2006 11:14:20 +0000
Subject: [KJ] [PATCH] string initialization in ForeRunnerHE driver
Message-Id: <200610011314.20555.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I had a look at http://www.kerneljanitors.org/TODO
Jeff Garzik writes that in most cases a string initialization like char
foo[] = "blah"; is preferred to an initialization like char *foo = "blah";
So I grep'd around the kernel sources and found an initialization in the
latter style in drivers/atm/he.c. This is my first patch ever sent to the
kj-mailing-list. I hope everything is fine with the patch-format and so on.
If not, please let me know...
I don't know if this patch is really needed. However, here it is (tested by
compilation):

Signed-off-by: Andi Drebes <webmaster@programmierforen.de>

diff --git a/drivers/atm/he.c b/drivers/atm/he.c
index f2511b4..f16a1ce 100644
--- a/drivers/atm/he.c
+++ b/drivers/atm/he.c
@@ -101,7 +101,7 @@ #endif /* HE_DEBUG */
 
 /* version definition */
 
-static char *version = "$Id: he.c,v 1.18 2003/05/06 22:57:15 chas Exp $";
+static char version[] = "$Id: he.c,v 1.18 2003/05/06 22:57:15 chas Exp $";
 
 /* declarations */
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
