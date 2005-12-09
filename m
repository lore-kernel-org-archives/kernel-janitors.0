From: Nicolas Kaiser <nikai@nikai.net>
Date: Fri, 09 Dec 2005 14:59:57 +0000
Subject: [KJ] [PATCH] crypto/aes: add unsigned to ints that can't go
Message-Id: <20051209155957.39daf59d@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32075659471074824=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32075659471074824==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

* Key length can't go negative, "unsigned int" is preferred to "int"
* E-Key is most frequently accessed struct member

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 aes.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/crypto/aes.c	2005-10-02 15:53:34.000000000 +0200
+++ b/crypto/aes.c	2005-12-09 15:35:18.000000000 +0100
@@ -77,9 +77,9 @@ byte(const u32 x, const unsigned n)
 #define u32_out(to, from) (*(u32 *)(to) = cpu_to_le32(from))
 
 struct aes_ctx {
-	int key_length;
 	u32 E[60];
 	u32 D[60];
+	unsigned int key_length;
 };
 
 #define E_KEY ctx->E
@@ -378,7 +378,7 @@ static void aes_decrypt(void *ctx_arg, u
 {
 	const struct aes_ctx *ctx = ctx_arg;
 	u32 b0[4], b1[4];
-	const int key_len = ctx->key_length;
+	const unsigned int key_len = ctx->key_length;
 	const u32 *kp = D_KEY + key_len + 20;
 
 	b0[0] = u32_in (in) ^ E_KEY[key_len + 24];

--===============32075659471074824==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32075659471074824==--
