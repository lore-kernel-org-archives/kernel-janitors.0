From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 18 May 2006 01:20:16 +0000
Subject: Re: [KJ] question about pci_dev_put
Message-Id: <20060518012016.GA6528@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19308095528258673=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446BAEC6.9080907@yahoo.fr>
In-Reply-To: <446BAEC6.9080907@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============19308095528258673==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18.05.2006 [01:16:22 +0200], trem wrote:
> Hi
> 
> I'm looking for information about pci_get_device and pci_dev_put. If my
> research are good,
> I've understood that pci_get_device increment the counter of the device
> returned, and it also
> decremented the counter of the device given as "from".
> 
> I've searched example in the source. I've found this one in
> arch/ppc/platforms/85xx/mpc85xx_cds_common.c(git kernel) :
> 
>     if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
>                                         PCI_DEVICE_ID_VIA_82C586_2,
> NULL))) {
>                 dev->irq = 10;
>                 pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 10);
>         pci_dev_put(dev);
>         }
> 
>     if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
>                                         PCI_DEVICE_ID_VIA_82C586_2, dev))) {
>                 dev->irq = 11;
>                 pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
>         pci_dev_put(dev);
>         }
> 
> So, if I don't mistake, this code is buggy, the counter is decremented
> twice in the second if.
> One in the pci_get_device and one in pci_dev_put. I'm on the right way ?

/me knows nothing about the PCI space, but looking at the comments for
pci_get_device() and tracing what pci_dev_put() does, it seems like you
are right.

It seems like the correct method is to remove the pci_dev_put(dev); from
the first if above and change the second one to

	if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
					PCI_DEVICE_ID_VIA_82C586_2, dev))) {
		dev->irq = 11;
		pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
		pci_dev_put(dev);
	} else
		pci_dev_put(dev);

In the if case, pci_get_device will call pci_dev_put() on the old
dev before returning the next dev. In the else case, there are no more
devices, so we drop the refcount with an explicit pci_dev_put(). In both
cases, we drop the refcount on the old dev.

Does that seem right?

I, of course, defer to Greg for the "actual" answer :)

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center

--===============19308095528258673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19308095528258673==--
