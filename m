From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 14:56:39 +0000
Subject: [KJ] [PATCH] drivers/message/fusion/*: convert to
Message-Id: <20050208145639.GP31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7L9kolmstoDTZ4pm"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--7L9kolmstoDTZ4pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--7L9kolmstoDTZ4pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_message_fusion.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/message/fusion/mptbase.c linux-2.6.11-rc3/drivers/message/fusion/mptbase.c
--- linux-2.6.11-rc3-vanilla/drivers/message/fusion/mptbase.c	2004-12-24 22:35:50.000000000 +0100
+++ linux-2.6.11-rc3/drivers/message/fusion/mptbase.c	2005-02-07 09:39:28.000000000 +0100
@@ -5914,7 +5914,7 @@ fusion_init(void)
 #ifdef CONFIG_PROC_FS
 	(void) procmpt_create();
 #endif
-	r = pci_module_init(&mptbase_driver);
+	r = pci_register_driver(&mptbase_driver);
 	if(r)
 		return(r);
 

--7L9kolmstoDTZ4pm
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--7L9kolmstoDTZ4pm--
