From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 23:42:41 +0000
Subject: [Kernel-janitors] [PATCH 2.6] [4/12] lopec.c replace
Message-Id: <57420000.1097106161@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============012522272329701156=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.com

--===============012522272329701156==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I have replaced this call with pci_get_device.
If someone with a PPC system could verify it I would appreciate it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

----

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/lopec.c linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/lopec.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/lopec.c	2004-09-29 20:04:57.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/lopec.c	2004-10-06 16:33:38.908846152 -0700
@@ -189,7 +189,7 @@ static unsigned long lopec_idedma_regbas
 static void
 lopec_ide_probe(void)
 {
-	struct pci_dev *dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
+	struct pci_dev *dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
 					      PCI_DEVICE_ID_WINBOND_82C105,
 					      NULL);
 	lopec_ide_ports_known = 1;
@@ -200,6 +200,7 @@ lopec_ide_probe(void)
 		lopec_ide_ctl_regbase[0] = dev->resource[1].start;
 		lopec_ide_ctl_regbase[1] = dev->resource[3].start;
 		lopec_idedma_regbase = dev->resource[4].start;
+		pci_dev_put(dev);
 	}
 }
 



--===============012522272329701156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============012522272329701156==--
