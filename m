From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 07 Oct 2004 22:51:44 +0000
Subject: [Kernel-janitors] [PATCH 2.6][7/12] pcore.c replace pci_find_device
Message-Id: <30730000.1097189504@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58093999592258294=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org

--===============58093999592258294==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device and pci_dev_put.
If someone with a PPC system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/pcore.c linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/pcore.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/pcore.c	2004-09-29 20:03:45.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/pcore.c	2004-10-07 15:30:31.839323128 -0700
@@ -89,7 +89,7 @@ pcore_pcibios_fixup(void)
 {
 	struct pci_dev *dev;
 
-	if ((dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
+	if ((dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
 				PCI_DEVICE_ID_WINBOND_83C553,
 				0)))
 	{
@@ -108,6 +108,7 @@ pcore_pcibios_fixup(void)
 		 */
  		outb(0x00, PCORE_WINBOND_PRI_EDG_LVL);
 		outb(0x1e, PCORE_WINBOND_SEC_EDG_LVL);
+		pci_dev_put(dev);
 	}
 }
 


--===============58093999592258294==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58093999592258294==--
