From: Domen Puncer <domen@coderock.org>
Date: Sat, 24 Jul 2004 20:06:15 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] kill KERNEL_VERSION duplicate
Message-Id: <20040724200615.GA2453@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11761139332964055=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11761139332964055==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Kill KERNEL_VERSION duplicate.
Funny that it insn't even used in here


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/media/video/videocodec.c	Fri Jul 23 16:00:21 2004
+++ a/drivers/media/video/videocodec.c	Sat Jul 24 21:51:37 2004
@@ -43,11 +43,6 @@
 #include <asm/uaccess.h>
 #endif
 
-#include <linux/version.h>
-#ifndef KERNEL_VERSION
-#define KERNEL_VERSION(a,b,c) ((a)*65536+(b)*256+(c))
-#endif
-
 #include "videocodec.h"
 
 static int debug = 0;

--===============11761139332964055==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11761139332964055==--
