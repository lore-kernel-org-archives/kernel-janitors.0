From: Greg KH <greg@kroah.com>
Date: Thu, 18 May 2006 17:37:43 +0000
Subject: Re: [KJ] question about pci_dev_put
Message-Id: <20060518173743.GF30887@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52399033425402042=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446BAEC6.9080907@yahoo.fr>
In-Reply-To: <446BAEC6.9080907@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============52399033425402042==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2006 at 10:36:12AM -0700, Greg KH wrote:
> On Thu, May 18, 2006 at 01:16:22AM +0200, trem wrote:
> > Hi
> > 
> > I'm looking for information about pci_get_device and pci_dev_put. If my
> > research are good,
> > I've understood that pci_get_device increment the counter of the device
> > returned, and it also
> > decremented the counter of the device given as "from".
> > 
> > I've searched example in the source. I've found this one in
> > arch/ppc/platforms/85xx/mpc85xx_cds_common.c(git kernel) :
> > 
> >     if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
> >                                         PCI_DEVICE_ID_VIA_82C586_2,
> > NULL))) {
> >                 dev->irq = 10;
> >                 pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 10);
> >         pci_dev_put(dev);
> >         }
> > 
> >     if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
> >                                         PCI_DEVICE_ID_VIA_82C586_2, dev))) {
> >                 dev->irq = 11;
> >                 pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
> >         pci_dev_put(dev);
> >         }
> > 
> > So, if I don't mistake, this code is buggy, the counter is decremented
> > twice in the second if.
> > One in the pci_get_device and one in pci_dev_put. I'm on the right way ?
> 
> Yes, the code is incorrect.  Here's a proper fix for it.  Kumar, feel
> free to apply.

Oops, that was wrong, here's the correct one, sorry about that:

-------

From: Greg Kroah-Hartman <gregkh@suse.de>
Subject: Fix incorrect pci reference counting in 85xx code

As pointed out by trem <tremyfr@yahoo.fr>

Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 arch/ppc/platforms/85xx/mpc85xx_cds_common.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--- gregkh-2.6.orig/arch/ppc/platforms/85xx/mpc85xx_cds_common.c
+++ gregkh-2.6/arch/ppc/platforms/85xx/mpc85xx_cds_common.c
@@ -379,13 +379,12 @@ mpc85xx_cds_pcibios_fixup(void)
                                         PCI_DEVICE_ID_VIA_82C586_2, NULL))) {
                 dev->irq = 10;
                 pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 10);
-		pci_dev_put(dev);
-        }
 
-	if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
+		if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
                                         PCI_DEVICE_ID_VIA_82C586_2, dev))) {
-                dev->irq = 11;
-                pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
+	                dev->irq = 11;
+	                pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
+		}
 		pci_dev_put(dev);
         }
 }

--===============52399033425402042==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52399033425402042==--
