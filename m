From: trem <tremyfr@yahoo.fr>
Date: Wed, 17 May 2006 23:16:22 +0000
Subject: [KJ] question about pci_dev_put
Message-Id: <446BAEC6.9080907@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

I'm looking for information about pci_get_device and pci_dev_put. If my
research are good,
I've understood that pci_get_device increment the counter of the device
returned, and it also
decremented the counter of the device given as "from".

I've searched example in the source. I've found this one in
arch/ppc/platforms/85xx/mpc85xx_cds_common.c(git kernel) :

    if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
                                        PCI_DEVICE_ID_VIA_82C586_2,
NULL))) {
                dev->irq = 10;
                pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 10);
        pci_dev_put(dev);
        }

    if ((dev = pci_get_device(PCI_VENDOR_ID_VIA,
                                        PCI_DEVICE_ID_VIA_82C586_2, dev))) {
                dev->irq = 11;
                pci_write_config_byte(dev, PCI_INTERRUPT_LINE, 11);
        pci_dev_put(dev);
        }

So, if I don't mistake, this code is buggy, the counter is decremented
twice in the second if.
One in the pci_get_device and one in pci_dev_put. I'm on the right way ?

thanks,
trem

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
