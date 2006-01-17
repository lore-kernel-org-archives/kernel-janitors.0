From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 17 Jan 2006 21:25:11 +0000
Subject: [KJ] [Patch] change if() BUG(); to BUG_ON() in
Message-Id: <1137533111.20230.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99824941128499867=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1137444792.2510.1.camel@localhost>
In-Reply-To: <1137444792.2510.1.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============99824941128499867==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes the if() BUG(); construct in
drivers/net/ixgb/ixgb_osdep.h to a BUG_ON; so defining
BUG to a no-op is safe.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h.orig	2006-01-17 22:12:00.000000000 +0100
+++ linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h	2006-01-17 22:12:46.000000000 +0100
@@ -60,7 +60,7 @@ typedef enum {
 } boolean_t;
 
 #undef ASSERT
-#define ASSERT(x)	if(!(x)) BUG()
+#define ASSERT(x)	BUG_ON(!(x))
 #define MSGOUT(S, A, B)	printk(KERN_DEBUG S "\n", A, B)
 
 #ifdef DBG



--===============99824941128499867==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99824941128499867==--
