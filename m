From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Thu, 22 Jan 2004 04:08:39 +0000
Subject: [Kernel-janitors] [PATCH] drivers/ide/ide-tape.c - handle kmalloc
Message-Id: <20040122040839.GA2456@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have not compile nor test this patch. stage has to be checked for
null. No trailing spaces too :) 

2902: static idetape_stage_t *__idetape_kmalloc_stage (..........)
[...]
2909:         if ((stage = (idetape_stage_t *) kmalloc (sizeof \
(idetape_stage_t),GFP_KERNEL)) = NULL)
2910:                 return NULL;

diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/drivers/ide/ide-tape.c 2.6.2-rc1-fix/drivers/ide/ide-tape.c
--- 2.6.2-rc1-orig/drivers/ide/ide-tape.c	2004-01-22 02:19:18.000000000 +0800
+++ 2.6.2-rc1-fix/drivers/ide/ide-tape.c	2004-01-22 12:01:56.000000000 +0800
@@ -3619,6 +3619,8 @@
 	printk(KERN_INFO "ide-tape: %s: reading back %d frames from the drive's internal buffer\n", tape->name, frames);
 	for (i = 0; i < frames; i++) {
 		stage = __idetape_kmalloc_stage(tape, 0, 0);
+		if (!stage)
+			return;
 		if (!first)
 			first = stage;
 		aux = stage->aux;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
