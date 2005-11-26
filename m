From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 26 Nov 2005 20:49:19 +0000
Subject: [KJ] [PATCH] drivers/macintosh/apm_emu.c: audit misc_register()
Message-Id: <20051126204919.GD30564@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29896199817064795=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29896199817064795==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Paolo Teti

Signed-off-by: Paolo Teti

--- linux-kj.orig/drivers/macintosh/apm_emu.c
+++ linux-kj/drivers/macintosh/apm_emu.c
@@ -520,6 +520,7 @@ static struct miscdevice apm_device = {
 static int __init apm_emu_init(void)
 {
 	struct proc_dir_entry *apm_proc;
+	int rc;
 
 	if (sys_ctrler != SYS_CTRLER_PMU) {
 		printk(KERN_INFO "apm_emu: Requires a machine with a PMU.\n");
@@ -530,7 +531,12 @@ static int __init apm_emu_init(void)
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	misc_register(&apm_device);
+	rc = misc_register(&apm_device);
+	if (rc < 0) {
+		remove_proc_entry("apm", NULL);
+		printk(KERN_ERR "apm_emu: Failed to register APM Emulation.\n");
+		return rc;
+	}
 
 	pmu_register_sleep_notifier(&apm_sleep_notifier);
 


--===============29896199817064795==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29896199817064795==--
