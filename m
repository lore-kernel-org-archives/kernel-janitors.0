From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 23 Sep 2004 22:28:31 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm2] Change cyrix.c driver to
Message-Id: <2770000.1095978511@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48752278169892443=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
In-Reply-To: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com

--===============48752278169892443==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I was able to compile this but not boot it as I dont have a cyrix processor.

Hanna 

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm2cln/arch/i386/kernel/cpu/cyrix.c linux-2.6.9-rc2-mm2patch/arch/i386/kernel/cpu/cyrix.c
--- linux-2.6.9-rc2-mm2cln/arch/i386/kernel/cpu/cyrix.c	2004-09-23 11:48:51.835616512 -0700
+++ linux-2.6.9-rc2-mm2patch/arch/i386/kernel/cpu/cyrix.c	2004-09-23 11:58:42.811774480 -0700
@@ -192,7 +192,7 @@ static void __init init_cyrix(struct cpu
 	unsigned char dir0, dir0_msn, dir0_lsn, dir1 = 0;
 	char *buf = c->x86_model_id;
 	const char *p = NULL;
-	struct pci_dev *dev;
+	int ret = -1;
 
 	/* Bit 31 in normal CPUID used for nonstandard 3DNow ID;
 	   3DNow is IDd by bit 31 in extended CPUID (1*32+31) anyway */
@@ -275,16 +275,12 @@ static void __init init_cyrix(struct cpu
 		/*
 		 *  The 5510/5520 companion chips have a funky PIT.
 		 */  
-		dev = pci_get_device(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510, NULL);
-		if (dev) {
-			pci_dev_put(dev);
+		ret = pci_dev_present(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510, NULL);
+		if (ret) 
 			pit_latch_buggy = 1;
-		}
-		dev =  pci_get_device(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520, NULL);
-		if (dev) {
-			pci_dev_put(dev);
+		ret =  pci_dev_present(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520, NULL);
+		if (ret) 
 			pit_latch_buggy = 1;
-		}
 
 		/* GXm supports extended cpuid levels 'ala' AMD */
 		if (c->cpuid_level == 2) {


--===============48752278169892443==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48752278169892443==--
