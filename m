From: Felipe W Damasio <felipewd@terra.com.br>
Date: Thu, 23 Sep 2004 04:19:30 +0000
Subject: [Kernel-janitors] [PATCH] 8139cp net driver: add MODULE_VERSION
Message-Id: <41524ED2.70306@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060402040608010905050809"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060402040608010905050809
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Hi Jeff,

	Add MODULE_VERSION to 8139cp net driver.

	Cheers,

Felipe

--------------060402040608010905050809
Content-Type: text/x-patch;
 name="8139cp-version.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="8139cp-version.patch"

Signed-off-by: Felipe W Damasio <felipewd@terra.com.br>

--- linux-2.6.9-rc2-bk8/drivers/net/8139cp.c.orig	2004-09-23 01:02:44.722495968 -0300
+++ linux-2.6.9-rc2-bk8/drivers/net/8139cp.c	2004-09-23 01:02:58.067467224 -0300
@@ -90,6 +90,7 @@
 
 MODULE_AUTHOR("Jeff Garzik <jgarzik@pobox.com>");
 MODULE_DESCRIPTION("RealTek RTL-8139C+ series 10/100 PCI Ethernet driver");
+MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE("GPL");
 
 static int debug = -1;

--------------060402040608010905050809
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060402040608010905050809--
