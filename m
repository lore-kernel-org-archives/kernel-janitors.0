From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:54:28 +0000
Subject: [KJ] [PATCH 5/] arch/i386/crypto/aes.c: fix sparse warnings
Message-Id: <200503100127.13390.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76897880499680982=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76897880499680982==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk1-sparse/arch/i386/crypto/aes.c
===================================================================
--- linux-2.6.11-bk1-sparse.orig/arch/i386/crypto/aes.c	2005-03-02 09:38:10.000000000 +0200
+++ linux-2.6.11-bk1-sparse/arch/i386/crypto/aes.c	2005-03-06 16:28:47.000000000 +0200
@@ -59,7 +59,7 @@ struct aes_ctx {
 };
 
 #define WPOLY 0x011b
-#define u32_in(x) le32_to_cpu(*(const u32 *)(x))
+#define u32_in(x) le32_to_cpup((const __le32 *)(x))
 #define bytes2word(b0, b1, b2, b3)  \
 	(((u32)(b3) << 24) | ((u32)(b2) << 16) | ((u32)(b1) << 8) | (b0))
 

--===============76897880499680982==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76897880499680982==--
