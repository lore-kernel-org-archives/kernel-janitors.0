From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 22 Jun 2005 08:00:00 +0000
Subject: [KJ] [PATCH][RESEND] Audit return code : drivers/macintosh/apm_emu.c
Message-Id: <20050622080000.GG5054@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98201224545032728=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98201224545032728==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii


description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


diff -urpNX dontdiff 2.6.12-orig/drivers/macintosh/apm_emu.c 2.6.12/drivers/macintosh/apm_emu.c
--- 2.6.12-orig/drivers/macintosh/apm_emu.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/macintosh/apm_emu.c	2005-06-22 09:15:21.000000000 +0200
@@ -515,19 +515,24 @@ static struct miscdevice apm_device = {
 
 static int __init apm_emu_init(void)
 {
+	int ret ;
 	struct proc_dir_entry *apm_proc;
 
 	if (sys_ctrler != SYS_CTRLER_PMU) {
 		printk(KERN_INFO "apm_emu: Requires a machine with a PMU.\n");
 		return -ENODEV;
 	}
-		
+
+	ret = misc_register(&apm_device);
+	if (ret) {
+		printk(KERN_WARNING "Unable to register misc device.\n");
+		return ret ;
+	}
+
 	apm_proc = create_proc_info_entry("apm", 0, NULL, apm_emu_get_info);
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	misc_register(&apm_device);
-
 	pmu_register_sleep_notifier(&apm_sleep_notifier);
 
 	printk(KERN_INFO "apm_emu: APM Emulation %s initialized.\n", driver_version);

--===============98201224545032728==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98201224545032728==--
