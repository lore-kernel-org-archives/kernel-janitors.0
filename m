From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 23:26:05 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] [2/12] chrp_pci.c replace
Message-Id: <55400000.1097105165@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82572452985549161=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <303220000.1096932072@w-hlinder.beaverton.ibm.com>
In-Reply-To: <303220000.1096932072@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, paulus@samba.org, benh@kernel.crashing.org

--===============82572452985549161==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Monday, October 04, 2004 04:21:12 PM -0700 Hanna Linder <hannal@us.ibm.com> wrote:

> 
> As pci_find_device is going away I have replaced this call with pci_get_device.
> If someone with a PPC system could verify it I would appreciate it.
> 
> Hanna Linder
> IBM Linux Technology Center
> 
> Signed-off-by: Hanna Linder <hannal@us.ibm.com>

Reroll this patch with new macro

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/chrp_pci.c linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/chrp_pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/chrp_pci.c	2004-09-29 20:06:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/chrp_pci.c	2004-10-06 16:15:44.000000000 -0700
@@ -158,7 +158,7 @@ chrp_pcibios_fixup(void)
 	struct device_node *np;
 
 	/* PCI interrupts are controlled by the OpenPIC */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		np = pci_device_to_OF_node(dev);
 		if ((np != 0) && (np->n_intrs > 0) && (np->intrs[0].line != 0))
 			dev->irq = np->intrs[0].line;


--===============82572452985549161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82572452985549161==--
