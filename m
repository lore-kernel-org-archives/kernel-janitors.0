From: Greg KH <greg@kroah.com>
Date: Tue, 28 Sep 2004 17:26:07 +0000
Subject: [Kernel-janitors] Re: Create new function to see if pci dev is
Message-Id: <20040928172607.GC29529@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76269131863640283=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com> <20040924200231.A30391@infradead.org> <20040924211912.GC7619@kroah.com> <1096059645.10797.1.camel@localhost.localdomain> <20040926141002.GA24942@kroah.com> <20040928172426.GA29529@kroah.com>
In-Reply-To: <20040928172426.GA29529@kroah.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Christoph Hellwig <hch@infradead.org>, davej@codemonkey.org.uk, hpa@zytor.com, kernel-janitors@lists.osdl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hanna Linder <hannal@us.ibm.com>

--===============76269131863640283==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 28, 2004 at 10:24:26AM -0700, Greg KH wrote:
> Ok, here's the patch that I applied to my trees, and I'll follow this up
> with a conversion of Hanna's two patches that I respun to use the new
> parameters of this function.

Here's the irq.c patch:

----------

PCI: change irq.c to use pci_dev_present

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
Signed-off-by: Greg Kroah-Hartman <greg@kroah.com>

diff -Nru a/arch/i386/pci/irq.c b/arch/i386/pci/irq.c
--- a/arch/i386/pci/irq.c	2004-09-28 10:21:40 -07:00
+++ b/arch/i386/pci/irq.c	2004-09-28 10:21:40 -07:00
@@ -452,21 +452,17 @@
 
 #endif
 
-
 static __init int intel_router_probe(struct irq_router *r, struct pci_dev *router, u16 device)
 {
-	struct pci_dev *dev1, *dev2;
+	static struct pci_device_id pirq_440gx[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82443GX_0) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82443GX_2) },
+		{ },
+	};
 
 	/* 440GX has a proprietary PIRQ router -- don't use it */
-	dev1 = pci_get_device(PCI_VENDOR_ID_INTEL,
-				PCI_DEVICE_ID_INTEL_82443GX_0, NULL);
-	dev2 = pci_get_device(PCI_VENDOR_ID_INTEL,
-				PCI_DEVICE_ID_INTEL_82443GX_2, NULL);
-	if ((dev1 != NULL) || (dev2 != NULL)) {
-		pci_dev_put(dev1);
-		pci_dev_put(dev2);
+	if (pci_dev_present(pirq_440gx))
 		return 0;
-	}
 
 	switch(device)
 	{

--===============76269131863640283==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76269131863640283==--
