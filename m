From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 10 Sep 2005 12:13:29 +0000
Subject: [KJ] [PATCH 1/4] arch/i386: Replace custom macro with isdigit()
Message-Id: <20050910121329.GB1218@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91304963799248151=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91304963799248151==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the custom is_digit() macro with isdigit() from <linux/ctype.h>

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 arch/i386/kernel/reboot.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff -urpN -X dontdiff linux-2.6.13/arch/i386/kernel/reboot.c linux-2.6.13~macro_removal/arch/i386/kernel/reboot.c
--- linux-2.6.13/arch/i386/kernel/reboot.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/arch/i386/kernel/reboot.c	2005-09-10 12:38:31.000000000 +0200
@@ -11,6 +11,7 @@
 #include <linux/mc146818rtc.h>
 #include <linux/efi.h>
 #include <linux/dmi.h>
+#include <linux/ctype.h>
 #include <asm/uaccess.h>
 #include <asm/apic.h>
 #include "mach_reboot.h"
@@ -27,8 +28,6 @@ static int reboot_thru_bios;
 
 #ifdef CONFIG_SMP
 static int reboot_cpu = -1;
-/* shamelessly grabbed from lib/vsprintf.c for readability */
-#define is_digit(c)	((c) >= '0' && (c) <= '9')
 #endif
 static int __init reboot_setup(char *str)
 {
@@ -48,9 +47,9 @@ static int __init reboot_setup(char *str
 			break;
 #ifdef CONFIG_SMP
 		case 's': /* "smp" reboot by executing reset on BSP or other CPU*/
-			if (is_digit(*(str+1))) {
+			if (isdigit(*(str+1))) {
 				reboot_cpu = (int) (*(str+1) - '0');
-				if (is_digit(*(str+2))) 
+				if (isdigit(*(str+2)))
 					reboot_cpu = reboot_cpu*10 + (int)(*(str+2) - '0');
 			}
 				/* we will leave sorting out the final value 

--===============91304963799248151==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91304963799248151==--
