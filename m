From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 10:18:42 +0000
Subject: [KJ] [PATCH] Audit return code :
Message-Id: <20050621101842.GI4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/i8j2F0k9BYX4qLc"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description :
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch_drivers_misc_hdpuftrs_hdpu_cpustate.c.diff"

diff -urpNX dontdiff 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c
--- 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-21 11:38:33.783957664 +0200
@@ -192,12 +192,19 @@ static int hdpu_cpustate_probe(struct de
 {
 	struct platform_device *pdev = to_platform_device(ddev);
 	struct resource *res;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	cpustate.set_addr = (unsigned long *)res->start;
 	cpustate.clr_addr = (unsigned long *)res->end - 1;
 
-	misc_register(&cpustate_dev);
+	if (ret = misc_register(&cpustate_dev)) {
+		printk(KERN_WARNING "Unable to register misc device.\n");
+		cpustate.set_addr = 0;
+		cpustate.clr_addr = 0;
+		return ret ;
+	}
+
 	create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
 
 	printk(KERN_INFO "Sky CPU State Driver v" SKY_CPUSTATE_VERSION "\n");

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--/i8j2F0k9BYX4qLc--
