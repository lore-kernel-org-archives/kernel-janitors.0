From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:25:24 +0000
Subject: [Kernel-janitors] [PATCH] Check return code in mm/vmscan.c
Message-Id: <20040103132524.GA21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/vmscan-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/vmscan.c 2.6.1-rc1-mm1-fix/mm/vmscan.c
--- 2.6.1-rc1-mm1/mm/vmscan.c	2004-01-03 20:33:39.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/mm/vmscan.c	2004-01-03 21:16:30.000000000 +0800
@@ -1093,10 +1093,16 @@
 
 static int __init kswapd_init(void)
 {
+	int ret;
 	pg_data_t *pgdat;
 	swap_setup();
-	for_each_pgdat(pgdat)
-		kernel_thread(kswapd, pgdat, CLONE_KERNEL);
+	for_each_pgdat(pgdat) {
+		ret = kernel_thread(kswapd, pgdat, CLONE_KERNEL);
+		if (ret < 0) {
+			printk("%s: unable to start kernel thread\n", __FUNCTION__);
+			return ret;
+		}
+	}
 	total_memory = nr_free_pagecache_pages();
 	return 0;
 }

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
