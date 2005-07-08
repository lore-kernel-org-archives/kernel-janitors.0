From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 21:47:55 +0000
Subject: [KJ] [PATCH] drivers/net/hamradio/ : Use of time_after_eq macro
Message-Id: <42CEF48B.1050409@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080409010305020303070302"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080409010305020303070302
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------080409010305020303070302
Content-Type: text/x-patch;
 name="baycom.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="baycom.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hamradio/baycom_epp.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/hamradio/baycom_epp.c	2005-07-08 15:06:06.436246240 -0300
@@ -54,6 +54,7 @@
 #include <linux/kmod.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 #if defined(CONFIG_AX25) || defined(CONFIG_AX25_MODULE)
 /* prototypes for ax25_encapsulate and ax25_rebuild_header */
 #include <net/ax25.h> 
@@ -287,7 +288,7 @@
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;

--- linux/drivers/net/hamradio/baycom_par.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/hamradio/baycom_par.c	2005-07-07 20:48:48.960977640 -0300
@@ -84,6 +84,7 @@
 #include <linux/baycom.h>
 #include <linux/parport.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/bug.h>
 #include <asm/system.h>
@@ -165,7 +166,7 @@
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;

--- linux/drivers/net/hamradio/baycom_ser_fdx.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/hamradio/baycom_ser_fdx.c	2005-07-07 22:54:03.806547464 -0300
@@ -79,6 +79,7 @@
 #include <asm/io.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 
 /* --------------------------------------------------------------------- */
 
@@ -159,7 +160,7 @@
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;

--- linux/drivers/net/hamradio/baycom_ser_hdx.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/hamradio/baycom_ser_hdx.c	2005-07-07 22:55:17.942277120 -0300
@@ -69,6 +69,7 @@
 #include <asm/io.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 
 /* --------------------------------------------------------------------- */
 
@@ -150,7 +151,7 @@
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;

--------------080409010305020303070302
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080409010305020303070302--
