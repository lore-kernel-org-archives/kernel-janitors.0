From: Christophe Lucas <c.lucas@ifrance.com>
Date: Wed, 02 Feb 2005 16:22:05 +0000
Subject: [KJ] [PATCH] [RESEND] pci_find_device() in drivers/media/radio/
Message-Id: <20050202162205.GD24725@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qjNfmADvan18RZcF"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
From : http://kerneljanitors.org/TODO
>- delete all pci_find_* functions from the kernel tree.
>  Instead of pci_find_device use pci_get_device()..
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="media_radio.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-gemtek-pci.c linux-2.6.11-rc2/drivers/media/radio/radio-gemtek-pci.c
--- linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-gemtek-pci.c	2005-01-26 08:31:14.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/radio/radio-gemtek-pci.c	2005-01-26 10:01:19.000000000 +0100
@@ -394,7 +394,7 @@ static struct pci_driver gemtek_pci_driv
 
 static int __init gemtek_pci_init_module( void )
 {
-	return pci_module_init( &gemtek_pci_driver );
+	return pci_register_driver( &gemtek_pci_driver );
 }
 
 static void __exit gemtek_pci_cleanup_module( void )
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c
--- linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c	2005-01-26 08:31:14.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c	2005-02-02 15:43:24.000000000 +0100
@@ -265,11 +265,11 @@ static int __init maestro_radio_init(voi
 {
 	register __u16 found=0;
 	struct pci_dev *pcidev = NULL;
-	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS, 
+	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS, 
 						  PCI_DEVICE_ID_ESS_ESS1968,
 						  pcidev)))
 		found |= radio_install(pcidev);
-	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS,
+	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS,
 						  PCI_DEVICE_ID_ESS_ESS1978, 
 						  pcidev)))
 		found |= radio_install(pcidev);
@@ -316,6 +316,7 @@ static __u16 radio_install(struct pci_de
 	if(radio_power_on(&radio_unit)) {
 		if(video_register_device(&maestro_radio, VFL_TYPE_RADIO, radio_nr)==-1) {
 			printk("radio-maestro: can't register device!");
+			pci_dev_put(pcidev);
 			return 0;
 		}
 		printk(KERN_INFO "radio-maestro: version "
@@ -326,7 +327,9 @@ static __u16 radio_install(struct pci_de
 		       "\n");
 		printk(KERN_INFO "radio-maestro: radio chip initialized\n");
 		return 1;
-	} else
+	} else {
+		pci_dev_put(pcidev); 
 		return 0;   
+	}
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maxiradio.c linux-2.6.11-rc2/drivers/media/radio/radio-maxiradio.c
--- linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maxiradio.c	2005-01-26 08:31:14.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/radio/radio-maxiradio.c	2005-01-26 10:01:28.000000000 +0100
@@ -337,7 +337,7 @@ static struct pci_driver maxiradio_drive
 
 static int __init maxiradio_radio_init(void)
 {
-	return pci_module_init(&maxiradio_driver);
+	return pci_register_driver(&maxiradio_driver);
 }
 
 static void __exit maxiradio_radio_exit(void)

--qjNfmADvan18RZcF
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--qjNfmADvan18RZcF--
