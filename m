From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 22 Mar 2005 16:18:40 +0000
Subject: [KJ] [PATCH] printk: drivers/acpi/pci_link.c
Message-Id: <20050322161840.GP14887@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iVCmgExH7+hIHJ1A"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_acpi_pci_link.c.diff"

diff -urpN -X dontdiff a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
--- a/drivers/acpi/pci_link.c	2005-03-18 02:33:50.000000000 +0100
+++ b/drivers/acpi/pci_link.c	2005-03-22 16:35:10.000000000 +0100
@@ -352,7 +352,7 @@ acpi_pci_link_set (
 		/* ignore resource_source, it's optional */
 		break;
 	default:
-		printk("ACPI BUG: resource_type %d\n", link->irq.resource_type);
+		printk(KERN_WARNING "ACPI BUG: resource_type %d\n", link->irq.resource_type);
 		result = -EINVAL;
 		goto end;
 

--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--iVCmgExH7+hIHJ1A--
