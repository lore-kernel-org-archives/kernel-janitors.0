From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 23 Mar 2005 15:16:16 +0000
Subject: [KJ] [PATCH] lib/sha1.c: fix sparse warning
Message-Id: <200503231816.16929.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91520266748032875=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91520266748032875==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fix

lib/sha1.c:44:10: warning: cast to restricted type

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

--- linux-2.6.12-rc1-bk1/lib/sha1.c.orig	2005-03-23 18:11:37.000000000 +0300
+++ linux-2.6.12-rc1-bk1/lib/sha1.c	2005-03-23 18:12:06.503319728 +0300
@@ -41,7 +41,7 @@ void sha_transform(__u32 *digest, const 
 	__u32 a, b, c, d, e, t, i;
 
 	for (i = 0; i < 16; i++)
-		W[i] = be32_to_cpu(((const __u32 *)in)[i]);
+		W[i] = be32_to_cpu(((const __be32 *)in)[i]);
 
 	for (i = 0; i < 64; i++)
 		W[i+16] = rol32(W[i+13] ^ W[i+8] ^ W[i+2] ^ W[i], 1);

--===============91520266748032875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91520266748032875==--
