From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 20:23:48 +0000
Subject: [Kernel-janitors] [PATCH 2.6][2/54] arch/i386/pci/acpi.c Use
Message-Id: <3740000.1097094228@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54733445806284342=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, hch@infradead.org

--===============54733445806284342==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Using the new for_each_pci_dev macro. Compiled and boot tested.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/i386/pci/acpi.c linux-2.6.9-rc3-mm2patch3/arch/i386/pci/acpi.c
--- linux-2.6.9-rc3-mm2cln/arch/i386/pci/acpi.c	2004-10-04 11:38:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch3/arch/i386/pci/acpi.c	2004-10-06 12:27:55.818932576 -0700
@@ -41,7 +41,7 @@ static int __init pci_acpi_init(void)
 		printk(KERN_INFO "** was specified.  If this was required to make a driver work,\n");
 		printk(KERN_INFO "** please email the output of \"lspci\" to bjorn.helgaas@hp.com\n");
 		printk(KERN_INFO "** so I can fix the driver.\n");
-		while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
+		for_each_pci_dev(dev);
 			acpi_pci_irq_enable(dev);
 	} else {
 		printk(KERN_INFO "** PCI interrupts are no longer routed automatically.  If this\n");


--===============54733445806284342==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54733445806284342==--
