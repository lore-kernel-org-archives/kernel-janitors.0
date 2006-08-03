From: Neil Horman <nhorman@tuxdriver.com>
Date: Thu, 03 Aug 2006 20:18:57 +0000
Subject: Re: [KJ] [PATCH] sh: fix proc file removal for superh store queue
Message-Id: <20060803201857.GC5004@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060803191828.GA5004@localhost.localdomain> <20060803124235.67bb664b.akpm@osdl.org>
In-Reply-To: <20060803124235.67bb664b.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: kernel-janitors@lists.osdl.org, linuxsh-dev@lists.sourceforge.net, lethal@linux-sh.org, kkojima@rr.iij4u.or.jp, linux-kernel@vger.kernel.org

Patch to clean up proc file removal in sq module for superh arch.  currently on
a failed module load or on module unload a proc file is left registered which
can cause a random memory execution or oopses if read after unload.  This patch
cleans up that deregistration.

Thanks & Regards
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 sq.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)


diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 781dbb1..4b2b0b1 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -421,18 +421,22 @@ static struct miscdevice sq_dev = {
 
 static int __init sq_api_init(void)
 {
+	int ret;
 	printk(KERN_NOTICE "sq: Registering store queue API.\n");
 
-#ifdef CONFIG_PROC_FS
 	create_proc_read_entry("sq_mapping", 0, 0, sq_mapping_read_proc, 0);
-#endif
 
-	return misc_register(&sq_dev);
+	ret = misc_register(&sq_dev);
+	if (ret) 
+		remove_proc_entry("sq_mapping", NULL);
+
+	return ret;
 }
 
 static void __exit sq_api_exit(void)
 {
 	misc_deregister(&sq_dev);
+	remove_proc_entry("sq_mapping", NULL);
 }
 
 module_init(sq_api_init);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
