From: Christophe Lucas <c.lucas@ifrance.com>
Date: Wed, 02 Feb 2005 08:17:27 +0000
Subject: [KJ] [PATCH] pci_register_driver() for
Message-Id: <20050202081727.GA24725@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
>>From : http://kerneljanitors.org/TODO
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pci_drivers_media_dvb_bt8xx.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/dvb/bt8xx/bt878.c linux-2.6.11-rc2/drivers/media/dvb/bt8xx/bt878.c
--- linux-2.6.11-rc2-vanilla/drivers/media/dvb/bt8xx/bt878.c	2005-01-24 17:07:56.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/dvb/bt8xx/bt878.c	2005-01-26 10:01:11.000000000 +0100
@@ -578,7 +578,7 @@ static int bt878_init_module(void)
 	/* later we register inside of bt878_find_audio_dma()
 	 * because we may want to ignore certain cards */
 	bt878_pci_driver_registered = 1;
-	return pci_module_init(&bt878_pci_driver);
+	return pci_register_driver(&bt878_pci_driver);
 }
 
 static void bt878_cleanup_module(void)

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--dDRMvlgZJXvWKvBx--
