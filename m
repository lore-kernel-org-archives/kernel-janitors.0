From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:38:45 +0000
Subject: [KJ] [PATCH] wavelan wireless driver: use strlcpy instead of memcpy
Message-Id: <20041109213845.GI9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============099886774825149516=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============099886774825149516==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In wavelan.c, use strlcpy instead of memcpy to copy the interface name parameter.

--- drivers/net/wireless/wavelan.c.orig	2004-11-09 20:40:22.086909592 +0100
+++ drivers/net/wireless/wavelan.c	2004-11-08 20:54:10.000000000 +0100
@@ -4344,7 +4344,7 @@ int init_module(void)
 		struct net_device *dev = alloc_etherdev(sizeof(net_local));
 		if (!dev)
 			break;
-		memcpy(dev->name, name[i], IFNAMSIZ);	/* Copy name */
+		strlcpy(dev->name, name[i], IFNAMSIZ);	/* Copy name */
 		dev->base_addr = io[i];
 		dev->irq = irq[i];
 

--===============099886774825149516==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============099886774825149516==--
