From: Paolo Teti <paolo.teti@gmail.com>
Date: Mon, 05 Dec 2005 15:42:30 +0000
Subject: Re: [KJ] 2.6.15-rc5-kj1
Message-Id: <34a7ae040512050742sed22d37y@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051205152717.GA6641@mipter.zuzino.mipt.ru>
In-Reply-To: <20051205152717.GA6641@mipter.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alexey,

> 2005/12/5, Alexey Dobriyan <adobriyan@gmail.com>:
..
> drivers_macintosh_apm_emu_c_audit_misc_register_return_value.patch

I think that the best case is to put the prev. patch into the dropped
list (I know it's the mine!)

Even if the patch it's ok the best solution is to raise only a WARNING without
removing the /proc interface.

In fact the /proc maybe usefull even if the APM emulation fail to register.

The best patch here below... Sorry

Signed-off-by: Paolo Teti <paolo.teti@gmail.com>

---
--- linux-2.6.15-rc2/drivers/macintosh/apm_emu.c.orig	Tue Nov 22 17:37:06 2005
+++ linux-2.6.15-rc2/drivers/macintosh/apm_emu.c	Thu Dec  1 11:25:14 2005
@@ -530,8 +530,9 @@ static int __init apm_emu_init(void)
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;

-	misc_register(&apm_device);
-
+	if (misc_register(&apm_device) != 0)
+		printk(KERN_WARNING "apm_emu: Failed to register APM Emulation.\n");
+	
 	pmu_register_sleep_notifier(&apm_sleep_notifier);

 	printk(KERN_INFO "apm_emu: APM Emulation %s initialized.\n", driver_version);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
