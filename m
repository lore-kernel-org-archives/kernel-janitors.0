From: "Rodrigo P. do Nascimento" <underscore0x5f@gmail.com>
Date: Thu, 07 Jul 2005 01:05:26 +0000
Subject: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes pci_find_device
Message-Id: <20050707010526.GA5406@garfield.casa.sp.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86864817850329157=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86864817850329157==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

I'm trying again. This time I checked whether the code isn't into the
#ifdef or #ifndef block. :)
I hope that it's right. My apologies whether something is wrong. I only
want to help the project.
I'm a newbie, so far.   :)

--- /usr/src/linux/drivers/scsi/qlogicfc.c	2005-06-22 16:33:05.000000000 -0300
+++ /usr/src/linux-kj/drivers/scsi/qlogicfc.c	2005-07-05 19:03:39.000000000 -0300
@@ -732,7 +732,7 @@ static int isp2x00_detect(Scsi_Host_Temp

 	for (i=0; i<2; i++){
 		pdev = NULL;
-	        while ((pdev = pci_find_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {
+	        while ((pdev = pci_get_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {
 			if (pci_enable_device(pdev))
 				continue;


--===============86864817850329157==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86864817850329157==--
