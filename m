From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:01:11 +0000
Subject: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <20050214150111.GH20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="aZoGpuMECXJckB41"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_char_watchdog.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/char/watchdog/pcwd_pci.c linux-2.6.11-rc4/drivers/char/watchdog/pcwd_pci.c
--- linux-2.6.11-rc4-vanilla/drivers/char/watchdog/pcwd_pci.c	2004-12-24 22:33:59.000000000 +0100
+++ linux-2.6.11-rc4/drivers/char/watchdog/pcwd_pci.c	2005-02-14 09:45:07.000000000 +0100
@@ -506,6 +506,7 @@ static int __devinit pcipcwd_card_init(s
 	int got_fw_rev, fw_rev_major, fw_rev_minor;
 	char fw_ver_str[20];
 	char option_switches;
+	int pci_dev_busy = 0 ;
 
 	cards_found++;
 	if (cards_found == 1)
@@ -534,6 +535,7 @@ static int __devinit pcipcwd_card_init(s
 		printk(KERN_ERR PFX "I/O address 0x%04x already in use\n",
 			(int) pcipcwd_private.io_addr);
 		ret = -EIO;
+		pci_dev_busy = 1 ;
 		goto err_out_disable_device;
 	}
 
@@ -621,7 +623,8 @@ err_out_unregister_reboot:
 err_out_release_region:
 	pci_release_regions(pdev);
 err_out_disable_device:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 	return ret;
 }
 

--aZoGpuMECXJckB41
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--aZoGpuMECXJckB41--
