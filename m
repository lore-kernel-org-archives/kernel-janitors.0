From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 08 Jul 2005 18:21:15 +0000
Subject: [KJ] [PATCH] GCC4 sched.c (x86_64) warning: control may reach end
Message-Id: <42CEC41B.1090309@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040203090700030204070304"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040203090700030204070304
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------040203090700030204070304
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="bitops.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bitops.patch"



This patch eliminates the GCC4 warning on the x86_64 platform:

kernel/sched.c:1824: warning: control may reach end of non-void function
'sched_find_first_bit' being inlined.

The change follows the lead of others, i.e. it is guaranteed that at least
one of b[0], b[1], or b[2] will have a bit set and evaluate to true. That
being said, GCC4.0.0 notices that the code flow does not return anything
if b[0], b[1] and b[2] are not true. Since we know better, if it's not b[0]
or b[1], it has to be b[2].

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
---


diff -puN include/asm-x86_64/bitops.h~bitops include/asm-x86_64/bitops.h
--- linux-2.6.13-rc2/include/asm-x86_64/bitops.h~bitops	2005-07-08 10:21:55.646887616 -0700
+++ linux-2.6.13-rc2-jessem/include/asm-x86_64/bitops.h	2005-07-08 10:22:37.738488720 -0700
@@ -348,8 +348,7 @@ static inline int sched_find_first_bit(c
 		return __ffs(b[0]);
 	if (b[1])
 		return __ffs(b[1]) + 64;
-	if (b[2])
-		return __ffs(b[2]) + 128;
+	return __ffs(b[2]) + 128;
 }
 
 /**
_


--------------040203090700030204070304
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040203090700030204070304--
