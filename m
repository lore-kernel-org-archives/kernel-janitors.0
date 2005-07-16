From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:28:31 +0000
Subject: [KJ] [RFC PATCH] drivers/net/hamradio/baycom_epp.c : Use of the
Message-Id: <42D8B71F.9090004@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040107000801020405030203"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040107000801020405030203
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------040107000801020405030203
Content-Type: text/x-patch;
 name="baycom_epp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="baycom_epp.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hamradio/baycom_epp.c	2005-07-13 17:53:28.000000000 -0300
+++ linux-kj/drivers/net/hamradio/baycom_epp.c	2005-07-16 03:46:40.491146568 -0300
@@ -911,7 +911,7 @@
 	/* autoprobe baud rate */
 	tstart = jiffies;
 	i = 0;
-	while ((signed)(jiffies-tstart-HZ/3) < 0) {
+	while (time_before(jiffies, tstart + HZ/3)) {
 		if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
 			goto epptimeout;
 		if ((stat & (EPP_NRAEF|EPP_NRHF)) == EPP_NRHF) {

--------------040107000801020405030203
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040107000801020405030203--
