From: Daniel Dickman <didickman@yahoo.com>
Date: Wed, 30 Mar 2005 04:59:25 +0000
Subject: [KJ] [patch 1/1] fix lib/sort regression test
Message-Id: <424A322D.3050507@yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The regression test in lib/sort.c is currently worthless because the array that is generated for sorting will be all zeros. This patch fixes things so 
that the array that is generated will contain unsorted integers (that are not all identical) as was probably intended.

Signed-off-by Daniel Dickman <didickman@yahoo.com>

--- linux-2.6.11-rc1/lib/sort.c	2005-03-29 23:44:19.921875000 -0500
+++ linux/lib/sort.c	2005-03-29 23:56:40.421875000 -0500
@@ -90,7 +90,7 @@

  static int sort_test(void)
  {
-	int *a, i, r = 0;
+	int *a, i, r = 1;

  	a = kmalloc(1000 * sizeof(int), GFP_KERNEL);
  	BUG_ON(!a);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
