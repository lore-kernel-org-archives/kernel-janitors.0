From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][24/26] net/ipv6/* - compile warning cleanup
Message-Id: <420BEF83.15055.587051@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============014764308717499564=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============014764308717499564==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: add MODULE definition compile fence so MODULE_DEVICE_TABLE 
vars not declared when compiled into the kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/sound/oss/ad1848.c linux-2.6.11-rc3-mm/sound/oss/ad1848.c
--- linux-2.6.11-rc3-mm-original/sound/oss/ad1848.c	2005-02-03 03:56:10.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/oss/ad1848.c	2005-02-07 21:16:11.000000000 +0200
@@ -2955,6 +2955,7 @@ static struct {
 	{NULL}
 };
 
+#ifdef MODULE
 static struct isapnp_device_id id_table[] __devinitdata = {
 	{	ISAPNP_VENDOR('C','M','I'), ISAPNP_DEVICE(0x0001),
 		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001), 0 },
@@ -2972,6 +2973,7 @@ static struct isapnp_device_id id_table[
 };
 
 MODULE_DEVICE_TABLE(isapnp, id_table);
+#endif /* MODULE */
 
 static struct pnp_dev *activate_dev(char *devname, char *resname, struct pnp_dev *dev)
 {




--===============014764308717499564==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============014764308717499564==--
