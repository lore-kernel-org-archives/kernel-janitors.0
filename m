From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:26:56 +0000
Subject: [Kernel-janitors] [PATCH] Check return code in mm/pdflush.c
Message-Id: <20040103132656.GC21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
In-Reply-To: <20040103132524.GA21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/pdflush-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/pdflush.c 2.6.1-rc1-mm1-fix/mm/pdflush.c
--- 2.6.1-rc1-mm1/mm/pdflush.c	2004-01-03 17:58:11.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/mm/pdflush.c	2004-01-03 20:25:30.000000000 +0800
@@ -223,7 +223,11 @@
 
 static void start_one_pdflush_thread(void)
 {
-	kernel_thread(pdflush, NULL, CLONE_KERNEL);
+	int ret;
+	
+	ret = kernel_thread(pdflush, NULL, CLONE_KERNEL);
+	if (ret < 0) 
+		printk("%s: unable to start kernel thread\n", __FUNCTION__);
 }
 
 static int __init pdflush_init(void)

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
