From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 01 Oct 2004 18:10:43 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 ia64/pci/pci.c] Replace
Message-Id: <112540000.1096654243@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============076116255453032355=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <12260000.1096486523@w-hlinder.beaverton.ibm.com>
In-Reply-To: <12260000.1096486523@w-hlinder.beaverton.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: greg@kroah.com, kernel-janitors@lists.osdl.org, Judith Lebzelter <judith@osdl.org>, davidm@hpl.hp.com, hannal@us.ibm.com

--===============076116255453032355==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away soon I have replaced the call with pci_get_device.
Judith, could you run these 3 ia64 ones through PLM, please? 

Thanks a lot.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc2-mm4cln/arch/ia64/pci/pci.c linux-2.6.9-rc2-mm4patch/arch/ia64/pci/pci.c
--- linux-2.6.9-rc2-mm4cln/arch/ia64/pci/pci.c	2004-09-28 14:58:07.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/arch/ia64/pci/pci.c	2004-09-30 16:48:22.511799264 -0700
@@ -154,7 +154,7 @@ extern acpi_status acpi_map_iosapic (acp
 		printk(KERN_INFO "** was specified.  If this was required to make a driver work,\n");
 		printk(KERN_INFO "** please email the output of \"lspci\" to bjorn.helgaas@hp.com\n");
 		printk(KERN_INFO "** so I can fix the driver.\n");
-		while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
+		while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
 			acpi_pci_irq_enable(dev);
 	} else {
 		printk(KERN_INFO "** PCI interrupts are no longer routed automatically.  If this\n");


--===============076116255453032355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============076116255453032355==--
