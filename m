From: "Paolo Teti" <tetipaol@libero.it>
Date: Tue, 22 Nov 2005 18:07:32 +0000
Subject: [KJ] [PATCH] linux-2.6.15-rc2 apm_emu.c audit misc_register() ret.
Message-Id: <IQDBOK$B9720DE2CB5707224B58DDA8FB05C27B@libero.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

from: Paolo Teti

fix a missing check on misc_register() return code

Signed-off-by: Paolo Teti <tetipaol@libero.it>

---
--- linux-2.6.15-rc2/drivers/macintosh/apm_emu.c.orig	Tue Nov 22 17:37:06 2005
+++ linux-2.6.15-rc2/drivers/macintosh/apm_emu.c	Tue Nov 22 18:03:31 2005
@@ -530,7 +530,11 @@ static int __init apm_emu_init(void)
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	misc_register(&apm_device);
+	if (misc_register(&apm_device) != 0) {
+		remove_proc_entry("apm", NULL);
+		printk(KERN_ERR "apm_emu: Failed to register APM Emulation.\n");
+		return -ENODEV;
+	}
 
 	pmu_register_sleep_notifier(&apm_sleep_notifier);
 



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
