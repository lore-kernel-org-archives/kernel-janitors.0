From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 08:59:03 +0000
Subject: [Kernel-janitors] [PATCH] Free mm if mm_init() fails
Message-Id: <20040104085903.GA3132@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/fork-free-mm-if-mm_init-fails-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/kernel/fork.c 2.6.1-rc1-mm1-fix/kernel/fork.c
--- 2.6.1-rc1-mm1/kernel/fork.c	2004-01-04 10:29:24.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/kernel/fork.c	2004-01-04 16:53:04.000000000 +0800
@@ -547,7 +547,7 @@
 	/* Copy the current MM stuff.. */
 	memcpy(mm, oldmm, sizeof(*mm));
 	if (!mm_init(mm))
-		goto fail_nomem;
+		goto free_pt;
 
 	if (init_new_context(tsk,mm))
 		goto fail_nocontext;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
