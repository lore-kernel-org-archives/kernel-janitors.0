From: Francois Romieu <romieu@fr.zoreil.com>
Date: Wed, 13 Oct 2004 22:33:40 +0000
Subject: Re: [KJ] [PATCH 2.6] firestream.c replace pci_find_device with
Message-Id: <20041013223340.GA32276@electric-eye.fr.zoreil.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92349236012818181=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com> <196320000.1097705843@w-hlinder.beaverton.ibm.com>
In-Reply-To: <196320000.1097705843@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, chas@cmf.nrl.navy.mil, greg@kroah.com

--===============92349236012818181==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hanna Linder <hannal@us.ibm.com> :
[...]

Too complicated.


Removal of dead code.

Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>

diff -puN drivers/atm/firestream.c~firestream-10 drivers/atm/firestream.c
--- linux-2.6.9-rc3/drivers/atm/firestream.c~firestream-10	2004-10-14 00:28:36.000000000 +0200
+++ linux-2.6.9-rc3-fr/drivers/atm/firestream.c	2004-10-14 00:29:18.000000000 +0200
@@ -2012,66 +2012,6 @@ void __devexit firestream_remove_one (st
 	func_exit ();
 }
 
-
-#if 0
-int __init fs_detect(void)
-{
-	struct pci_dev  *pci_dev;
-	int devs = 0;
-
-	func_enter ();
-	pci_dev = NULL;
-	while ((pci_dev = pci_find_device(PCI_VENDOR_ID_FUJITSU_ME,
-					  PCI_DEVICE_ID_FUJITSU_FS50, 
-					  pci_dev))) {
-		if (fs_register_and_init (pci_dev, &fs_pci_tbl[0]))
-			break;
-		devs++;
-	}
-
-	while ((pci_dev = pci_find_device(PCI_VENDOR_ID_FUJITSU_ME,
-					  PCI_DEVICE_ID_FUJITSU_FS155, 
-					  pci_dev))) {
-		if (fs_register_and_init (pci_dev, FS_IS155)) 
-			break;
-		devs++;
-	}
-	func_exit ();
-	return devs;
-}
-#else
-
-#if 0
-int __init init_PCI (void)
-{ /* Begin init_PCI */
-	
-	int pci_count;
-	printk ("init_PCI\n");
-	/*
-	  memset (&firestream_driver, 0, sizeof (firestream_driver));
-	  firestream_driver.name = "firestream";
-	  firestream_driver.id_table = firestream_pci_tbl;
-	  firestream_driver.probe = fs_register_and_init;
-	*/
-	pci_count = pci_register_driver (&firestream_driver);
-	
-	if (pci_count <= 0) {
-		pci_unregister_driver (&firestream_driver);
-		pci_count = 0;
-	}
-
-	return(pci_count);
-
-} /* End init_PCI */
-#endif
-#endif
-
-/*
-#ifdef MODULE
-#define firestream_init init_module
-#endif 
-*/
-
 static struct pci_device_id firestream_pci_tbl[] = {
 	{ PCI_VENDOR_ID_FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS50, 
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, FS_IS50},

_

--===============92349236012818181==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92349236012818181==--
