From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:52 +0000
Subject: [KJ] [PATCH][RESUBMIT][9/21] drivers/net/* - compile warning cleanup
Message-Id: <42113C2C.17871.52BDF2@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61256178139852757=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61256178139852757==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - silence compiler warning for 
unused function that is either actually used as a driver function in a 
table or is truly unused

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/net/ibmlana.c linux-2.6.11-rc3-mm2/drivers/net/ibmlana.c
--- linux-2.6.11-rc3-mm2-original/drivers/net/ibmlana.c	2005-02-12 12:06:38.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/net/ibmlana.c	2005-02-12 17:22:13.000000000 +0200
@@ -901,7 +901,7 @@ static void ibmlana_set_multicast_list(s
 
 static int startslot;		/* counts through slots when probing multiple devices */
 
-static int ibmlana_probe(struct net_device *dev)
+static int __attribute__((unused)) ibmlana_probe(struct net_device *dev)
 {
 	int slot, z;
 	int base = 0, irq = 0, iobase = 0, memlen = 0;




--===============61256178139852757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61256178139852757==--
