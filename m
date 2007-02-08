From: Surya <surya.prabhakar@wipro.com>
Date: Thu, 08 Feb 2007 09:15:39 +0000
Subject: [KJ] pci_dev_put related?
Message-Id: <1170925419.2500.13.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
   I am trying to replace all the pci_find_device references with
pci_get_device and pci_dev_put(for usage decrement).

I got stuck in the file linux-2.6/drivers/ide/pci/hpt366.c

In the function init_setup_hpt366 I am not sure where I can call
pci_dev_put to decrement the usage count.

--------------snip----------------
        pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin1);
//while ((findev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID,findev)) !NULL) {
while (( findev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID,findev)) !NULL) {
                if ((findev->vendor = dev->vendor) &&
                    (findev->device = dev->device) &&
                    ((findev->devfn - dev->devfn) = 1) &&
                    (PCI_FUNC(findev->devfn) & 1)) {
                        pci_read_config_byte(findev, PCI_INTERRUPT_PIN,
&pin2);
                        if ((pin1 != pin2) && (dev->irq = findev->irq))
{
                                d->bootable = ON_BOARD;
                                printk("%s: onboard version of chipset,
"
                                        "pin1=%d pin2=%d\n", d->name,
                                        pin1, pin2);
                        }

// I dont think I can call it here because of the return
                        return ide_setup_pci_devices(dev, findev, d);
                }
        }
init_single:
        return ide_setup_pci_device(dev, d);
}


----------------snip --------------------

-spn.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
