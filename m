From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:01:09 +0000
Subject: [KJ] [PATCH] crypto/tea.c: fix sparse warnings
Message-Id: <200503100156.01640.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11983622042176068=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11983622042176068==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/crypto/tea.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/crypto/tea.c	2005-03-02 09:38:34.000000000 +0200
+++ linux-2.6.11-bk3-sparse/crypto/tea.c	2005-03-08 14:58:50.000000000 +0200
@@ -31,8 +31,8 @@
 #define XTEA_ROUNDS		32
 #define XTEA_DELTA		0x9e3779b9
 
-#define u32_in(x) le32_to_cpu(*(const u32 *)(x))
-#define u32_out(to, from) (*(u32 *)(to) = cpu_to_le32(from))
+#define u32_in(x) le32_to_cpup((const __le32 *)(x))
+#define u32_out(to, from) (*(__le32 *)(to) = cpu_to_le32(from))
 
 struct tea_ctx {
 	u32 KEY[4];

--===============11983622042176068==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11983622042176068==--
