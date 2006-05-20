From: trem <tremyfr@yahoo.fr>
Date: Sat, 20 May 2006 00:50:31 +0000
Subject: [KJ] [PATCH] drivers/char/istallion.c : replace pci_find_device by
Message-Id: <446E67D7.8080502@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090109010103060006050707"
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4ADA.3070606@yahoo.fr>
In-Reply-To: <446A4ADA.3070606@yahoo.fr>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090109010103060006050707
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter when the loop is broken, so unload could be done.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---


--------------090109010103060006050707
Content-Type: text/x-patch;
	name*0="istallion_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="istallion_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/istallion.c b/drivers/char/istallion.c
index ef20c1f..83002d5 100644
--- a/drivers/char/istallion.c
+++ b/drivers/char/istallion.c
@@ -4576,10 +4576,12 @@ static int stli_findpcibrds(void)
 	printk("stli_findpcibrds()\n");
 #endif
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_STALLION,
+	while ((dev = pci_get_device(PCI_VENDOR_ID_STALLION,
 	    PCI_DEVICE_ID_ECRA, dev))) {
-		if ((rc = stli_initpcibrd(BRD_ECPPCI, dev)))
+		if ((rc = stli_initpcibrd(BRD_ECPPCI, dev))) {
+			pci_dev_put(dev);
 			return(rc);
+		}
 	}
 
 	return(0);

--------------090109010103060006050707
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090109010103060006050707--
