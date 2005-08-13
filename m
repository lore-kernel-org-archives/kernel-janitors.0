From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 13 Aug 2005 11:25:15 +0000
Subject: [KJ] [PATCH] add new macro BIT_S to include/linux/kernel.h
Message-Id: <42FDD89B.1010106@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090203080802070103070805"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090203080802070103070805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

description:
adds a new macro for doing a bitshift. right now every subsystem defines 
its own macro (which all look the same) but this one also does overflow 
checking like it is already done in include/linux/input.h

patch is against latest git-tree from Linus

Signed-off-by: Michael Veeck <michael@veeck.de>


--------------090203080802070103070805
Content-Type: text/plain;
 name="bitmacro_include-kernel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bitmacro_include-kernel.patch"

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -30,6 +30,11 @@ extern const char linux_banner[];
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 #define ALIGN(x,a) (((x)+(a)-1)&~((a)-1))
 
+/*
+ * BIT macro that also handles a possible overflow
+ */
+#define BITS(x) (1UL << ((x) % BITS_PER_LONG))
+
 #define	KERN_EMERG	"<0>"	/* system is unusable			*/
 #define	KERN_ALERT	"<1>"	/* action must be taken immediately	*/
 #define	KERN_CRIT	"<2>"	/* critical conditions			*/

--------------090203080802070103070805
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090203080802070103070805--
