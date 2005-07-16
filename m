From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:04:38 +0000
Subject: [KJ] [PATCH] drivers/usb/input/ati_remote.c : Use of the
Message-Id: <42D8B186.5020706@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000509080702000409000504"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D4ABE6.6010601@feitoza.com.br>
In-Reply-To: <42D4ABE6.6010601@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000509080702000409000504
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------000509080702000409000504
Content-Type: text/x-patch;
 name="ati_remote.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ati_remote.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/usb/input/ati_remote.c	2005-07-13 17:53:35.000000000 -0300
+++ linux-kj/drivers/usb/input/ati_remote.c	2005-07-14 15:44:54.660430016 -0300
@@ -476,7 +476,8 @@
 		/* Filter duplicate events which happen "too close" together. */
 		if ((ati_remote->old_data[0] == data[1]) &&
 			(ati_remote->old_data[1] == data[2]) &&
-			((ati_remote->old_jiffies + FILTER_TIME) > jiffies)) {
+			(time_before(jiffies, ati_remote->old_jiffies 
+				     + FILTER_TIME))) {
 			ati_remote->repeat_count++;
 		} else {
 			ati_remote->repeat_count = 0;

--------------000509080702000409000504
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000509080702000409000504--
