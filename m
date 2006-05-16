From: trem <tremyfr@yahoo.fr>
Date: Tue, 16 May 2006 22:45:54 +0000
Subject: [KJ] [PATCH] drivers/char/istallion.c : change pci_find_device by
Message-Id: <446A5622.4070308@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020109090109050608070006"
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4ADA.3070606@yahoo.fr>
In-Reply-To: <446A4ADA.3070606@yahoo.fr>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020109090109050608070006
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter, so unload could be done. I've added a pci_dev_put(dev)
before the return to avoid missing one device (thanks greg k-h for the
remark)

Signed-Off-By: trem <tremyfr@yahoo.fr>
---


--------------020109090109050608070006
Content-Type: text/x-patch;
	name*0="istallion_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="istallion_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/istallion.c b/drivers/char/istallion.c
index ef20c1f..b10eea7 100644
--- a/drivers/char/istallion.c
+++ b/drivers/char/istallion.c
@@ -4576,10 +4576,13 @@ static int stli_findpcibrds(void)
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
+		pci_dev_put(dev);
 	}
 
 	return(0);

--------------020109090109050608070006
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020109090109050608070006--
