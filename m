From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:29 +0000
Subject: [KJ] [PATCH][11/26] drivers/net/* - compile warning cleanup
Message-Id: <420BEF85.8267.587727@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45731632197171024=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45731632197171024==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - silence compiler warning for 
unused function that is either actually used as a driver function in a 
table or is truly unused

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/net/ibmlana.c linux-2.6.11-rc3-mm/drivers/net/ibmlana.c
--- linux-2.6.11-rc3-mm-original/drivers/net/ibmlana.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/net/ibmlana.c	2005-02-08 18:09:49.000000000 +0200
@@ -901,7 +901,7 @@ static void ibmlana_set_multicast_list(s
 
 static int startslot;		/* counts through slots when probing multiple devices */
 
-static int ibmlana_probe(struct net_device *dev)
+static int __attribute__((__unused__)) ibmlana_probe(struct net_device *dev)
 {
 	int slot, z;
 	int base = 0, irq = 0, iobase = 0, memlen = 0;




--===============45731632197171024==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45731632197171024==--
