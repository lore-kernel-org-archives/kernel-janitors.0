From: "Przemek Lib" <an.przemek@gmail.com>
Date: Sat, 17 Mar 2007 12:54:18 +0000
Subject: [KJ] [PATCH] changing pci api to newer
Message-Id: <adc360f60703170554s63c65837x4a1586a5114a269@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
In-Reply-To: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

changed pci_find_device to pci_get_device
Signed-of-by Przemyslaw Lib an.przemek@gmail.com
---
I found "delete all pci_find_* functions from the kernel tree. Instead
of pci_find_device use pci_get_device()." on:
http://kernelnewbies.org/KernelJanitors/Todo

and i found pci_find_device in
drivers/isdn/hisax/diva.c
and changed it to pci_get_devices

--- drivers/isdn/hisax/diva.c.origin    2007-03-17 13:30:05.000000000 +0100
+++ drivers/isdn/hisax/diva.c   2007-03-17 13:31:32.000000000 +0100
@@ -1047,21 +1047,21 @@ setup_diva(struct IsdnCard *card)
 #endif
 #ifdef CONFIG_PCI
               cs->subtyp = 0;
-               if ((dev_diva = pci_find_device(PCI_VENDOR_ID_EICON,
+               if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
                       PCI_DEVICE_ID_EICON_DIVA20, dev_diva))) {
                       if (pci_enable_device(dev_diva))
                               return(0);
                       cs->subtyp = DIVA_PCI;
                       cs->irq = dev_diva->irq;
                       cs->hw.diva.cfg_reg = pci_resource_start(dev_diva, 2);
-               } else if ((dev_diva_u = pci_find_device(PCI_VENDOR_ID_EICON,
+               } else if ((dev_diva_u = pci_get_device(PCI_VENDOR_ID_EICON,
                       PCI_DEVICE_ID_EICON_DIVA20_U, dev_diva_u))) {
                       if (pci_enable_device(dev_diva_u))
                               return(0);
                       cs->subtyp = DIVA_PCI;
                       cs->irq = dev_diva_u->irq;
                       cs->hw.diva.cfg_reg = pci_resource_start(dev_diva_u, 2);
-               } else if ((dev_diva201 = pci_find_device(PCI_VENDOR_ID_EICON,
+               } else if ((dev_diva201 = pci_get_device(PCI_VENDOR_ID_EICON,
                       PCI_DEVICE_ID_EICON_DIVA201, dev_diva201))) {
                       if (pci_enable_device(dev_diva201))
                               return(0);
@@ -1071,7 +1071,7 @@ setup_diva(struct IsdnCard *card)
                               (ulong)
ioremap(pci_resource_start(dev_diva201, 0), 4096);
                       cs->hw.diva.cfg_reg                                (ulong)
ioremap(pci_resource_start(dev_diva201, 1), 4096);
-               } else if ((dev_diva202 = pci_find_device(PCI_VENDOR_ID_EICON,
+               } else if ((dev_diva202 = pci_get_device(PCI_VENDOR_ID_EICON,
                       PCI_DEVICE_ID_EICON_DIVA202, dev_diva202))) {
                       if (pci_enable_device(dev_diva202))
                               return(0);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
