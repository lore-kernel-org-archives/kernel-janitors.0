From: "Pedram M" <pmessri@gmail.com>
Date: Sat, 31 Mar 2007 13:39:01 +0000
Subject: [KJ] my first janitorial
Message-Id: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

for: drivers/char/istallion.c


@@ -4590,7 +4590,7 @@
        printk("stli_findpcibrds()\n");
 #endif

-       while ((dev = pci_find_device(PCI_VENDOR_ID_STALLION,
+       while ((dev = pci_get_device(PCI_VENDOR_ID_STALLION,
            PCI_DEVICE_ID_ECRA, dev))) {
                if ((rc = stli_initpcibrd(BRD_ECPPCI, dev)))
                        return(rc);


Thanks,
Pedram
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
