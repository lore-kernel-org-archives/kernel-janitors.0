From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 21 Feb 2006 21:23:33 +0000
Subject: [KJ] [Patch] change dash2underscore return value to char
Message-Id: <1140557014.26124.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75963686841345035=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75963686841345035==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since dash2underscore() just operates and returns chars,
i guess its safe to change the return value to a char.
With my .config, this reduces its size by 5 bytes.

   text    data     bss     dec     hex filename
   4150     152       0    4302    10ce params.o
   4155     152       0    4307    10d3 params.o.orig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/kernel/params.c.orig	2006-02-21 22:18:51.000000000 +0100
+++ linux-2.6.16-rc4/kernel/params.c	2006-02-21 22:19:00.000000000 +0100
@@ -31,7 +31,7 @@
 #define DEBUGP(fmt, a...)
 #endif
 
-static inline int dash2underscore(char c)
+static inline char dash2underscore(char c)
 {
 	if (c == '-')
 		return '_';



--===============75963686841345035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75963686841345035==--
