From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 23:13:59 +0000
Subject: [Kernel-janitors] [PATCH] cpcihp_zt5550.c ioremap/iounmap audit
Message-Id: <1074294839.12959.90.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Again insert missing iounmap()

diffed against 2.6.1

Leann

=== drivers/pci/hotplug/cpcihp_zt5550.c 1.3 vs edited ==--- 1.3/drivers/pci/hotplug/cpcihp_zt5550.c	Thu Jul 31 08:59:04 2003
+++ edited/drivers/pci/hotplug/cpcihp_zt5550.c	Fri Jan 16 09:29:26 2004
@@ -133,6 +133,8 @@
 {
 	if(!hc_dev)
 		return -ENODEV;
+
+	iounmap(hc_registers);
 	release_mem_region(pci_resource_start(hc_dev, 1),
 			   pci_resource_len(hc_dev, 1));
 	return 0;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
