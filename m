From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:03:00 +0000
Subject: [KJ] [PATCH] crypto/blowfish.c: fix sparse warnings
Message-Id: <200503100155.24596.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44311486520169829=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============44311486520169829==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/crypto/blowfish.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/crypto/blowfish.c	2005-03-02 09:37:49.000000000 +0200
+++ linux-2.6.11-bk3-sparse/crypto/blowfish.c	2005-03-08 14:48:31.000000000 +0200
@@ -349,8 +349,8 @@ static void encrypt_block(struct bf_ctx 
 
 static void bf_encrypt(void *ctx, u8 *dst, const u8 *src)
 {
-	const u32 *in_blk = (const u32 *)src;
-	u32 *const out_blk = (u32 *)dst;
+	const __be32 *in_blk = (const __be32 *)src;
+	__be32 *const out_blk = (__be32 *)dst;
 	u32 in32[2], out32[2];
 
 	in32[0] = be32_to_cpu(in_blk[0]);
@@ -362,8 +362,8 @@ static void bf_encrypt(void *ctx, u8 *ds
 
 static void bf_decrypt(void *ctx, u8 *dst, const u8 *src)
 {
-	const u32 *in_blk = (const u32 *)src;
-	u32 *const out_blk = (u32 *)dst;
+	const __be32 *in_blk = (const __be32 *)src;
+	__be32 *const out_blk = (__be32 *)dst;
 	const u32 *P = ((struct bf_ctx *)ctx)->p;
 	const u32 *S = ((struct bf_ctx *)ctx)->s;
 	u32 yl = be32_to_cpu(in_blk[0]);

--===============44311486520169829==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44311486520169829==--
