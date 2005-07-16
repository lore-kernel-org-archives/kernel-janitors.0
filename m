From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:23:00 +0000
Subject: [KJ] [PATCH] drivers/cdrom/sonycd535.c : Use of the time_before()
Message-Id: <42D8B5D4.7070000@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060707050408040306080007"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060707050408040306080007
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------060707050408040306080007
Content-Type: text/x-patch;
 name="sonycd535.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sonycd535.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/cdrom/sonycd535.c	2005-07-13 17:53:26.000000000 -0300
+++ linux-kj/drivers/cdrom/sonycd535.c	2005-07-15 15:51:46.557015728 -0300
@@ -130,6 +130,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 
 #define REALLY_SLOW_IO
 #include <asm/system.h>
@@ -384,7 +385,7 @@
 	int read_status;
 
 	snap = jiffies;
-	while (jiffies-snap < SONY_JIFFIES_TIMEOUT) {
+	while (time_before(jiffies, snap + SONY_JIFFIES_TIMEOUT)) {
 		read_status = inb(read_status_reg);
 		if ((read_status & SONY535_RESULT_NOT_READY_BIT) == 0) {
 #if DEBUG > 1
@@ -630,7 +631,7 @@
 		/* wait for data to be ready */
 		int data_valid = 0;
 		snap = jiffies;
-		while (jiffies-snap < SONY_JIFFIES_TIMEOUT) {
+		while (time_before(jiffies, snap + SONY_JIFFIES_TIMEOUT)) {
 			read_status = inb(read_status_reg);
 			if ((read_status & SONY535_RESULT_NOT_READY_BIT) == 0) {
 				read_exec_status(status);
@@ -1483,7 +1484,7 @@
 
 	outb(0, read_status_reg);	/* does a reset? */
 	snap = jiffies;
-	while (jiffies-snap < SONY_JIFFIES_TIMEOUT) {
+	while (time_before(jiffies, snap + SONY_JIFFIES_TIMEOUT)) {
 		select_unit(0);
 		if (inb(result_reg) != 0xff) {
 			got_result = 1;

--------------060707050408040306080007
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060707050408040306080007--
