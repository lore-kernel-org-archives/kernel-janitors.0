From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 26 Jun 2005 19:29:39 +0000
Subject: [KJ] [PATCH] [RESEND] Fix warning: type qualifiers ignored on
Message-Id: <1119814180.30604.23.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Sj8r7lJ/6QV8oNILHmhG"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-Sj8r7lJ/6QV8oNILHmhG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Per GCC manual: Constant functions that have no side effects need to use
the attribute '__attribute__((__const__))' rather than '__const__'.
Putting a '__const__' in the return type of a function is simply ignored
and causes GCC4 to issue the warning: type qualifiers ignored on
function return.

The header files compiler-gcc2.h, compiler-gcc3.h and compiler-gcc4.h
all have the definition:

#define __attribute_const__   __attribute__((__const__))

'__attribute_const__' seems to be the preferred and correct syntax to
declare a constant function.


--=-Sj8r7lJ/6QV8oNILHmhG
Content-Disposition: attachment; filename=patch
Content-Type: text/plain; name=patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc6.kj/include/linux/byteorder/swabb.h~	2005-06-24 13:26:11.775129040 -0700
+++ linux-2.6.12-rc6.kj/include/linux/byteorder/swabb.h	2005-06-26 11:34:30.935218568 -0700
@@ -92,7 +92,7 @@
 #endif /* OPTIMIZE */


-static __inline__ __const__ __u32 __fswahw32(__u32 x)
+static __inline__ __attribute_const__ __u32 __fswahw32(__u32 x)
 {
 	return __arch__swahw32(x);
 }
@@ -106,7 +106,7 @@ static __inline__ void __swahw32s(__u32
 }


-static __inline__ __const__ __u32 __fswahb32(__u32 x)
+static __inline__ __attribute_const__ __u32 __fswahb32(__u32 x)
 {
 	return __arch__swahb32(x);
 }

--=-Sj8r7lJ/6QV8oNILHmhG
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-Sj8r7lJ/6QV8oNILHmhG--
