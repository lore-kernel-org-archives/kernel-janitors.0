From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:02:56 +0000
Subject: [KJ] [PATCH] crypto/sha512.c: fix sparse warnings
Message-Id: <200503100154.41659.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14798541590916114=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14798541590916114==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/crypto/sha512.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/crypto/sha512.c	2005-03-02 09:38:26.000000000 +0200
+++ linux-2.6.11-bk3-sparse/crypto/sha512.c	2005-03-08 14:46:44.000000000 +0200
@@ -105,7 +105,7 @@ static const u64 sha512_K[80] = {
 
 static inline void LOAD_OP(int I, u64 *W, const u8 *input)
 {
-	W[I] = __be64_to_cpu( ((u64*)(input))[I] );
+	W[I] = __be64_to_cpu( ((__be64*)(input))[I] );
 }
 
 static inline void BLEND_OP(int I, u64 *W)

--===============14798541590916114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14798541590916114==--
