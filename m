From: Christophe Lucas <clucas@altern.org>
Date: Tue, 01 Feb 2005 16:32:43 +0000
Subject: [KJ] [PATCH] pci_register_driver() for drivers/media/dvb/b2c2/
Message-Id: <20050201163243.GU7569@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9Ek0hoCL9XbhcSqy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050128110438.GA8645@rhum.iomeda.fr>
In-Reply-To: <20050128110438.GA8645@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
From : http://kerneljanitors.org/TODO
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas at ifrance.com>
-- 
Christophe

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_drivers_media_dvb_b2c2.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/dvb/b2c2/skystar2.c linux-2.6.11-rc2/drivers/media/dvb/b2c2/skystar2.c
--- linux-2.6.11-rc2-vanilla/drivers/media/dvb/b2c2/skystar2.c	2005-01-26 08:31:14.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/dvb/b2c2/skystar2.c	2005-01-26 10:01:02.000000000 +0100
@@ -2599,7 +2599,7 @@ static struct pci_driver skystar2_pci_dr
 
 static int skystar2_init(void)
 {
-	return pci_module_init(&skystar2_pci_driver);
+	return pci_register_driver(&skystar2_pci_driver);
 }
 
 static void skystar2_cleanup(void)

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--9Ek0hoCL9XbhcSqy--
