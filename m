From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 23 Jun 2005 07:22:23 +0000
Subject: [KJ] [PATCH][RESEND] Audit return code : drivers/macintosh/apm_emu.c
Message-Id: <20050623072223.GC5075@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39158707364945111=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622080000.GG5054@rhum.iomeda.fr>
In-Reply-To: <20050622080000.GG5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============39158707364945111==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


diff -urpNX dontdiff 2.6.12-orig/drivers/macintosh/apm_emu.c 2.6.12/drivers/macintosh/apm_emu.c
--- 2.6.12-orig/drivers/macintosh/apm_emu.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/macintosh/apm_emu.c	2005-06-23 08:59:15.301551864 +0200
@@ -515,19 +515,24 @@ static struct miscdevice apm_device = {
 
 static int __init apm_emu_init(void)
 {
+	int ret;
 	struct proc_dir_entry *apm_proc;
 
 	if (sys_ctrler != SYS_CTRLER_PMU) {
 		printk(KERN_INFO "apm_emu: Requires a machine with a PMU.\n");
 		return -ENODEV;
 	}
-		
+
+	ret = misc_register(&apm_device);
+	if (ret) {
+		printk(KERN_WARNING "apm_emu: Unable to register misc device.\n");
+		return ret;
+	}
+
 	apm_proc = create_proc_info_entry("apm", 0, NULL, apm_emu_get_info);
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	misc_register(&apm_device);
-
 	pmu_register_sleep_notifier(&apm_sleep_notifier);
 
 	printk(KERN_INFO "apm_emu: APM Emulation %s initialized.\n", driver_version);

--===============39158707364945111==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39158707364945111==--
