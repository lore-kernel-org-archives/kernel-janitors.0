From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 23:29:06 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] [3/12] gemini_pci.c replace
Message-Id: <56110000.1097105346@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90826865939170598=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <307270000.1096934114@w-hlinder.beaverton.ibm.com>
In-Reply-To: <307270000.1096934114@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, paulus@samba.org, benh@kernel.crashing.org

--===============90826865939170598==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Monday, October 04, 2004 04:55:14 PM -0700 Hanna Linder <hannal@us.ibm.com> wrote:

> As pci_find_device is going away I have replaced this call with pci_get_device.
> If someone with a PPC system could verify it I would appreciate it.
> 
> Hanna Linder
> IBM Linux Technology Center
> 
> Signed-off-by: Hanna Linder <hannal@us.ibm.com>

Reroll this patch to use new macro

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/gemini_pci.c linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/gemini_pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/gemini_pci.c	2004-09-29 20:04:25.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch2/arch/ppc/platforms/gemini_pci.c	2004-10-06 16:22:53.979890256 -0700
@@ -15,7 +15,7 @@ void __init gemini_pcibios_fixup(void)
 	int i;
 	struct pci_dev *dev = NULL;
 	
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		for(i = 0; i < 6; i++) {
 			if (dev->resource[i].flags & IORESOURCE_IO) {
 				dev->resource[i].start |= (0xfe << 24);


--===============90826865939170598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90826865939170598==--
