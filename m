From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 20:13:34 +0000
Subject: [KJ] [PATCH 2.6] pmac_pci.c replace pci_find_device with
Message-Id: <77970000.1097266414@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47972920542946107=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70860000.1097257256@w-hlinder.beaverton.ibm.com> <73910000.1097257899@w-hlinder.beaverton.ibm.com>
In-Reply-To: <73910000.1097257899@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, paulus@samba.org, anton@samba.org

--===============47972920542946107==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



As pci_find_device is going away I've replaced it with pci_get_device and pci_dev_put.
If someone with a PPC64 system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pmac_pci.c linux-2.6.9-rc3-mm3patch/arch/ppc64/kernel/pmac_pci.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pmac_pci.c	2004-10-07 15:54:29.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/ppc64/kernel/pmac_pci.c	2004-10-08 10:42:47.000000000 -0700
@@ -669,7 +669,7 @@ void __init pmac_pcibios_fixup(void)
 {
 	struct pci_dev *dev = NULL;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
+	for_each_pci_dev(dev)
 		pci_read_irq_line(dev);
 
 	pci_fix_bus_sysdata();


--===============47972920542946107==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47972920542946107==--
