From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:02:01 +0000
Subject: [KJ] [PATCH] crypto/sha256.c: fix sparse warnings
Message-Id: <200503100154.02125.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============043529502206162363=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============043529502206162363==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk4-sparse/crypto/sha256.c
===================================================================
--- linux-2.6.11-bk4-sparse.orig/crypto/sha256.c	2005-03-10 00:28:44.000000000 +0200
+++ linux-2.6.11-bk4-sparse/crypto/sha256.c	2005-03-10 00:40:06.000000000 +0200
@@ -58,7 +58,7 @@ static inline u32 Maj(u32 x, u32 y, u32 
 
 static inline void LOAD_OP(int I, u32 *W, const u8 *input)
 {
-	W[I] = __be32_to_cpu( ((u32*)(input))[I] );
+	W[I] = __be32_to_cpu( ((__be32*)(input))[I] );
 }
 
 static inline void BLEND_OP(int I, u32 *W)

--===============043529502206162363==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============043529502206162363==--
