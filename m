From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 20:55:22 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8] convert
Message-Id: <15470000.1096491322@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89695322864502969=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, kraxel@bytesex.org

--===============89695322864502969==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away need to replace it. This file did not use the dev returned
from pci_find_device so is replaceable by pci_dev_present. I was not able to test it
as I do not have the hardware.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/media/video/bttv-driver.c linux-2.6.9-rc2-mm4patch/drivers/media/video/bttv-driver.c
--- linux-2.6.9-rc2-mm4cln/drivers/media/video/bttv-driver.c	2004-09-28 14:58:35.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/media/video/bttv-driver.c	2004-09-29 13:08:59.369697520 -0700
@@ -4012,6 +4012,10 @@ static int bttv_init_module(void)
 {
 	int rc;
 	bttv_num = 0;
+	static struct pci_device_id cx2388x[] {
+		{ PCI_DEVICE(0x14f1, 0x8800) },
+		{ },
+	};
 
 	printk(KERN_INFO "bttv: driver version %d.%d.%d loaded\n",
 	       (BTTV_VERSION_CODE >> 16) & 0xff,
@@ -4036,7 +4040,7 @@ static int bttv_init_module(void)
 	rc = pci_module_init(&bttv_pci_driver);
 	if (-ENODEV == rc) {
 		/* plenty of people trying to use bttv for the cx2388x ... */
-		if (NULL != pci_find_device(0x14f1, 0x8800, NULL))
+		if (pci_dev_present(cx2388x))
 			printk("bttv doesn't support your Conexant 2388x card.\n");
 	}
 	return rc;


--===============89695322864502969==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89695322864502969==--
