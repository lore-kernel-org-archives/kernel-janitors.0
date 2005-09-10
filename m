From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 10 Sep 2005 12:16:33 +0000
Subject: [KJ] [PATCH 2/4] arch/ppc: Replace custom macro with isdigit()
Message-Id: <20050910121633.GC1218@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90369634785813746=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: akpm@osdl.org, linuxppc-dev@ozlabs.org

--===============90369634785813746==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the custom is_digit() macro with isdigit() from <linux/ctype.h>

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 arch/ppc/boot/common/misc-common.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff -urpN -X dontdiff linux-2.6.13/arch/ppc/boot/common/misc-common.c linux-2.6.13~macro_removal/arch/ppc/boot/common/misc-common.c
--- linux-2.6.13/arch/ppc/boot/common/misc-common.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/arch/ppc/boot/common/misc-common.c	2005-09-10 12:38:31.000000000 +0200
@@ -16,6 +16,7 @@
 
 #include <stdarg.h>	/* for va_ bits */
 #include <linux/config.h>
+#include <linux/ctype.h>
 #include <linux/string.h>
 #include <linux/zlib.h>
 #include "nonstdio.h"
@@ -301,8 +302,6 @@ _printk(char const *fmt, ...)
 	return;
 }
 
-#define is_digit(c) ((c >= '0') && (c <= '9'))
-
 void
 _vprintk(void(*putc)(const char), const char *fmt0, va_list ap)
 {
@@ -329,7 +328,7 @@ _vprintk(void(*putc)(const char), const 
 			{
 				zero_fill = FALSE;
 			}
-			while (is_digit(c))
+			while (isdigit(c))
 			{
 				left_prec = (left_prec * 10) + (c - '0');
 				c = *fmt0++;
@@ -338,7 +337,7 @@ _vprintk(void(*putc)(const char), const 
 			{
 				c = *fmt0++;
 				zero_fill++;
-				while (is_digit(c))
+				while (isdigit(c))
 				{
 					right_prec = (right_prec * 10) + (c - '0');
 					c = *fmt0++;

--===============90369634785813746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90369634785813746==--
