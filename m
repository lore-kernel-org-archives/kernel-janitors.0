From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 30 Jan 2005 16:33:43 +0000
Subject: [KJ] [PATCH] [RESEND] pci_register_driver() for
Message-Id: <20050130172045.GB5605@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
From : http://kerneljanitors.org/TODO
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

-- 
Christophe

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci-register-drivers_media_common.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/common/saa7146_core.c linux-2.6.11-rc2/drivers/media/common/saa7146_core.c
--- linux-2.6.11-rc2-vanilla/drivers/media/common/saa7146_core.c	2005-01-26 08:31:13.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/common/saa7146_core.c	2005-01-26 10:00:51.000000000 +0100
@@ -539,7 +539,7 @@ int saa7146_register_extension(struct sa
 	ext->driver.remove = saa7146_remove_one;
 
 	printk("saa7146: register extension '%s'.\n",ext->name);
-	return pci_module_init(&ext->driver);
+	return pci_register_driver(&ext->driver);
 }
 
 int saa7146_unregister_extension(struct saa7146_extension* ext)

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--1yeeQ81UyVL57Vl7--
