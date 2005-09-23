From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 08:43:53 +0000
Subject: [KJ] printk : arch/alpha/kernel/pci.c
Message-Id: <20050923084353.GC10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52953120800219455=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52953120800219455==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/pci.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/pci.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/pci.c
@@ -408,7 +408,7 @@ pcibios_set_master(struct pci_dev *dev)
 	u8 lat;
 	pci_read_config_byte(dev, PCI_LATENCY_TIMER, &lat);
 	if (lat >= 16) return;
-	printk("PCI: Setting latency timer of device %s to 64\n",
+	printk(KERN_INFO "PCI: Setting latency timer of device %s to 64\n",
 							pci_name(dev));
 	pci_write_config_byte(dev, PCI_LATENCY_TIMER, 64);
 }


--===============52953120800219455==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52953120800219455==--
