From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 18 May 2006 02:47:53 +0000
Subject: Re: [KJ] question about pci_dev_put
Message-Id: <20060518024753.GH1604@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17448933987459636=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446BAEC6.9080907@yahoo.fr>
In-Reply-To: <446BAEC6.9080907@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============17448933987459636==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2006 at 06:20:16PM -0700, Nishanth Aravamudan wrote:
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
> /me knows nothing about the PCI space, but looking at the comments for
> pci_get_device() and tracing what pci_dev_put() does, it seems like you
> are right.
> 
> It seems like the correct method is to remove the pci_dev_put(dev); from
> the first if above and change the second one to
> 
> 	if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
> 					PCI_DEVICE_ID_VIA_82C586_2, dev))) {
> 		dev->irq = 11;
> 		pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
> 		pci_dev_put(dev);
> 	} else
> 		pci_dev_put(dev);
> 
> In the if case, pci_get_device will call pci_dev_put() on the old
> dev before returning the next dev. In the else case, there are no more
> devices, so we drop the refcount with an explicit pci_dev_put(). In both
> cases, we drop the refcount on the old dev.
> 
> Does that seem right?

No.  pci_get_device unconditionally does pci_dev_put().  So if should
just be:

	if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
					PCI_DEVICE_ID_VIA_82C586_2, dev))) {
		dev->irq = 11;
		pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
		pci_dev_put(dev);
	}


--===============17448933987459636==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17448933987459636==--
