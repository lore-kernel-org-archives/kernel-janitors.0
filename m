From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 02 Oct 2006 12:00:05 +0000
Subject: [KJ] [PATCH] misc_register : arch/x86_64/kernel/mce.c
Message-Id: <20061002120004.GA7232@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description :
Audit return codes (and handle failure correctly) for misc_register.


Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.18/arch/x86_64/kernel/mce.c
=================================--- linux-2.6.18.orig/arch/x86_64/kernel/mce.c	2006-10-02 13:57:17.000000000 +0200
+++ linux-2.6.18/arch/x86_64/kernel/mce.c	2006-10-02 13:57:58.000000000 +0200
@@ -663,7 +663,9 @@
 	}
 
 	register_hotcpu_notifier(&mce_cpu_notifier);
-	misc_register(&mce_log_device);
+	err = misc_register(&mce_log_device);
+	if (err < 0)
+		printk(KERN_ERR, "Failed to register mce.\n");
 	return err;
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
