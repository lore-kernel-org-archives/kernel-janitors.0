From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 10 Sep 2005 12:21:13 +0000
Subject: [KJ] [PATCH 4/4] drivers/video: Replace custom macro with isdigit()
Message-Id: <20050910122113.GE1218@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34799739861661205=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34799739861661205==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the custom CHAR_IS_NUM() macro with isdigit() from
<linux/ctype.h>

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/video/pm3fb.c |    3 ++-
 include/video/pm3fb.h |    3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff -urpN -X dontdiff linux-2.6.13/drivers/video/pm3fb.c linux-2.6.13~macro_removal/drivers/video/pm3fb.c
--- linux-2.6.13/drivers/video/pm3fb.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/drivers/video/pm3fb.c	2005-09-10 12:38:31.000000000 +0200
@@ -67,6 +67,7 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 #include <linux/ioport.h>
+#include <linux/ctype.h>
 
 #include <video/fbcon.h>
 #include <video/fbcon-mfb.h>
@@ -2594,7 +2595,7 @@ static char *pm3fb_boardnum_setup(char *
 {
 	char *next;
 
-	if (!(CHAR_IS_NUM(options[0]))) {
+	if (!(isdigit(options[0]))) {
 		(*bn) = 0;
 		return (options);
 	}
diff -urpN -X dontdiff linux-2.6.13/include/video/pm3fb.h linux-2.6.13~macro_removal/include/video/pm3fb.h
--- linux-2.6.13/include/video/pm3fb.h	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/include/video/pm3fb.h	2005-09-10 12:38:31.000000000 +0200
@@ -1142,9 +1142,6 @@
 /* do we want accelerated console  */
 #define PM3FB_USE_ACCEL 1
 
-/* useful ? */
-#define CHAR_IS_NUM(a)  ((((a) >= '0') && ((a) <= '9')) ? 1 : 0)
-
 /* for driver debugging ONLY */
 /* 0 = assert only, 1 = error, 2 = info, 3+ = verbose */
 /* define PM3FB_MASTER_DEBUG 1 */

--===============34799739861661205==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34799739861661205==--
