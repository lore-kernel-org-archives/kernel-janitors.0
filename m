From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 07 Feb 2005 10:17:36 +0000
Subject: [KJ] [PATCH] drivers/char/watchdog/*: convert to pci_register_driver
Message-Id: <20050207101736.GE21028@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cHMo6Wbp1wrKhbfi"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_char_watchdog.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/char/watchdog/pcwd_pci.c linux-2.6.11-rc3/drivers/char/watchdog/pcwd_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/char/watchdog/pcwd_pci.c	2004-12-24 22:33:59.000000000 +0100
+++ linux-2.6.11-rc3/drivers/char/watchdog/pcwd_pci.c	2005-02-07 09:39:27.000000000 +0100
@@ -659,7 +659,7 @@ static int __init pcipcwd_init_module(vo
 {
 	spin_lock_init (&pcipcwd_private.io_lock);
 
-	return pci_module_init(&pcipcwd_driver);
+	return pci_register_driver(&pcipcwd_driver);
 }
 
 static void __exit pcipcwd_cleanup_module(void)

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--cHMo6Wbp1wrKhbfi--
