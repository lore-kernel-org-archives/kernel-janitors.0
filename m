From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 30 Sep 2004 09:29:48 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 fore200e.c] convert
Message-Id: <415BD20C.6050709@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98011327609352739=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98011327609352739==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I'm sending this only to kernel-janitor since I'm not sure, if I do this 
right (It's my first patch). It compiled without problems here.

Description: Use pci_get_device instead of pci_find_device.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -Nrup linux-2.6.9-rc2-mm4-vanilla/drivers/atm/fore200e.c 
linux-2.6.9-rc2-mm4/drivers/atm/fore200e.c
--- linux-2.6.9-rc2-mm4-vanilla/drivers/atm/fore200e.c  2004-09-30 
10:24:43.000000000 +0200
+++ linux-2.6.9-rc2-mm4/drivers/atm/fore200e.c  2004-09-30 
10:41:20.368794120 +0200
@@ -644,7 +644,7 @@ fore200e_pca_detect(const struct fore200
      int              count = index;

      do {
-       pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, 
PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
+       pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, 
PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
         if (pci_dev == NULL)
             return NULL;
      } while (count--);

--===============98011327609352739==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98011327609352739==--
