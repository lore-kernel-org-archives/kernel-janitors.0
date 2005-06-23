From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 23 Jun 2005 07:33:39 +0000
Subject: [KJ] [PATCH][RESEND] Audit return code :
Message-Id: <20050623073339.GE5075@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98365558349416293=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622080346.GH5054@rhum.iomeda.fr>
In-Reply-To: <20050622080346.GH5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============98365558349416293==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


diff -urpNX dontdiff 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c
--- 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-23 09:28:15.924936888 +0200
@@ -192,13 +192,25 @@ static int hdpu_cpustate_probe(struct de
 {
 	struct platform_device *pdev = to_platform_device(ddev);
 	struct resource *res;
+	struct proc_dir_entry *proc_de;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	cpustate.set_addr = (unsigned long *)res->start;
 	cpustate.clr_addr = (unsigned long *)res->end - 1;
 
-	misc_register(&cpustate_dev);
-	create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
+	ret = misc_register(&cpustate_dev);
+	if (ret) {
+		printk(KERN_WARNING "sky_cpustate: Unable to register misc device.\n");
+		cpustate.set_addr = NULL;
+		cpustate.clr_addr = NULL;
+		return ret;
+	}
+
+	proc_de = create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
+	if (proc_de == NULL) {
+		printk(KERN_WARNING "sky_cpustate: Unable to create proc dir entry.\n");
+	}
 
 	printk(KERN_INFO "Sky CPU State Driver v" SKY_CPUSTATE_VERSION "\n");
 	return 0;
@@ -206,8 +218,8 @@ static int hdpu_cpustate_probe(struct de
 static int hdpu_cpustate_remove(struct device *ddev)
 {
 
-	cpustate.set_addr = 0;
-	cpustate.clr_addr = 0;
+	cpustate.set_addr = NULL;
+	cpustate.clr_addr = NULL;
 
 	remove_proc_entry("sky_cpustate", NULL);
 	misc_deregister(&cpustate_dev);

--===============98365558349416293==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98365558349416293==--
