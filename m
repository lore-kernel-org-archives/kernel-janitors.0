From: Amit Gud <>
Date: Thu, 20 Jan 2005 09:53:16 +0000
Subject: [KJ] [PATCH] Resend: drivers/ide/pci/cs5520.c fix return code value
Message-Id: <200501201518.42117.Amit Gud >
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75658835509368938=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75658835509368938==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description: The patch follows from the suggestions by AC and Felipe W Damasio for fixing the return codes from IDE drivers.

Do consider applying.


Signed-off-by: Amit Gud <gud@eth.net>

--- vanilla-2.6.10/drivers/ide/pci/cs5520.c	2005-01-19 11:19:28.000000000 +0530
+++ linux-2.6.9/drivers/ide/pci/cs5520.c	2005-01-20 14:41:24.000000000 +0530
@@ -224,7 +224,7 @@ static int __devinit cs5520_init_one(str
 	if(pci_enable_device_bars(dev, 1<<2))
 	{
 		printk(KERN_WARNING "%s: Unable to enable 55x0.\n", d->name);
-		return 1;
+		return -ENODEV;
 	}
 	pci_set_master(dev);
 	if (pci_set_dma_mask(dev, 0xFFFFFFFF)) {


--===============75658835509368938==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75658835509368938==--
