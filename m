From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 17:40:56 +0000
Subject: [KJ] [PATCH 2.6] pSeries_pci.c replace pci_find_device with
Message-Id: <70860000.1097257256@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8316095746570995=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70640000.1097257199@w-hlinder.beaverton.ibm.com>
In-Reply-To: <70640000.1097257199@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, anton@samba.org

--===============8316095746570995==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a PPC64 system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pSeries_pci.c linux-2.6.9-rc3-mm3patch3/arch/ppc64/kernel/pSeries_pci.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pSeries_pci.c	2004-10-07 15:54:30.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch3/arch/ppc64/kernel/pSeries_pci.c	2004-10-08 10:24:00.064501400 -0700
@@ -646,7 +646,7 @@ void __init pSeries_final_fixup(void)
 
 	check_s7a();
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		pci_read_irq_line(dev);
 		if (s7a_workaround) {
 			if (dev->irq > 16) {


--===============8316095746570995==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8316095746570995==--
