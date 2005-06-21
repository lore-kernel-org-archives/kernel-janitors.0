From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 10:17:26 +0000
Subject: [KJ] [PATCH] Audit return code : drivers/macintosh/apm_emu.c
Message-Id: <20050621101726.GH4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="f61P+fpdnY2FZS1u"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch_drivers_macintosh_apm_emu.c.diff"

diff -urpNX dontdiff 2.6.12-orig/drivers/macintosh/apm_emu.c 2.6.12/drivers/macintosh/apm_emu.c
--- 2.6.12-orig/drivers/macintosh/apm_emu.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/macintosh/apm_emu.c	2005-06-21 11:36:39.094393128 +0200
@@ -515,6 +515,7 @@ static struct miscdevice apm_device = {
 
 static int __init apm_emu_init(void)
 {
+	int ret ;
 	struct proc_dir_entry *apm_proc;
 
 	if (sys_ctrler != SYS_CTRLER_PMU) {
@@ -522,12 +523,15 @@ static int __init apm_emu_init(void)
 		return -ENODEV;
 	}
 		
+	if (ret = misc_register(&apm_device)) {
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

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--f61P+fpdnY2FZS1u--
