From: Carl Spalletta <ioanamitu@yahoo.com>
Date: Mon, 29 Mar 2004 01:49:27 +0000
Subject: [Kernel-janitors] old patches never die?
Message-Id: <20040329014927.38963.qmail@web60501.mail.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

  It seems as if a relatively small percentage of -kj patches ultimately
get merged at kernel.org.  For example the kswapd_init_fail patch from
2.6.3-kj1 and 2.6.4-rc2-kj1 not only didn't get merged but the file (mm/vmscan.c)
has since been patched (for a different purpose) at the same location. So that
patch would have to be redone anyway:

--- linux-263/mm/vmscan.c	2004-02-17 19:57:16.000000000 -0800
+++ linux-263-kj1/mm/vmscan.c	2004-02-18 14:42:03.000000000 -0800
@@ -1087,10 +1087,14 @@ int shrink_all_memory(int nr_pages)
 
 static int __init kswapd_init(void)
 {
+	int ret;
 	pg_data_t *pgdat;
 	swap_setup();
-	for_each_pgdat(pgdat)
-		kernel_thread(kswapd, pgdat, CLONE_KERNEL);
+	for_each_pgdat(pgdat) {
+		ret = kernel_thread(kswapd, pgdat, CLONE_KERNEL);
+		if (ret < 0)
+			panic("%s: unable to initialise kswapd\n", __FUNCTION__);
+	}
 	total_memory = nr_free_pagecache_pages();
 	return 0;
 }

  Perhaps it was deemed unnecessary to panic() if kswapd doesnt start ;).

  Generally speaking, what if anything can a janitor do to get positive or 
negative feedback on a submission?

__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
