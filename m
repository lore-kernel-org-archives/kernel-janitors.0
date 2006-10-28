From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 28 Oct 2006 16:30:18 +0000
Subject: [KJ] [PATCH] lib/string.c: Two if-clauses merged
Message-Id: <200610281830.18748.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch just deletes two lines of code and nothing else. Tested by 
compilation.

Signed-off-by: Andi Drebes <webmaster@programmierforen.de>

--- linux/lib/string.c	2006-10-14 05:34:03.000000000 +0200
+++ patched/lib/string.c	2006-10-28 18:21:11.000000000 +0200
@@ -43,9 +43,7 @@
 			c2 = *s2;
 			s1++;
 			s2++;
-			if (!c1)
-				break;
-			if (!c2)
+			if (!c1 || !c2)
 				break;
 			if (c1 = c2)
 				continue;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
