From: trem <tremyfr@yahoo.fr>
Date: Sat, 27 May 2006 19:57:56 +0000
Subject: [KJ] [PATCH] drivers/char/mxser.c : replace pci_find_device by
Message-Id: <4478AF44.3040701@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080607080605040102000506"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080607080605040102000506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>
 
This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added after the
loop to decrement the counter if necessary.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---



--------------080607080605040102000506
Content-Type: text/x-patch;
	name="mxser_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="mxser_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index 0fb2fb9..8d235a1 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -817,7 +817,7 @@ static int mxser_init(void)
 	index = 0;
 	b = 0;
 	while (b < n) {
-		pdev = pci_find_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
+		pdev = pci_get_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
 			if (pdev == NULL) {
 			b++;
 			continue;
@@ -854,6 +854,9 @@ static int mxser_init(void)
 			m++;
 		}
 	}
+	if (pdev != NULL) {
+		pci_dev_put(pdev);
+	}
 #endif
 
 	retval = tty_register_driver(mxvar_sdriver);

--------------080607080605040102000506
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080607080605040102000506--
