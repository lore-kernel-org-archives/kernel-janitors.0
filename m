From: Colin King <colin.king@canonical.com>
Date: Sun, 20 Aug 2017 21:34:38 +0000
Subject: [PATCH] crypto: aesni: make arrays aesni_simd_skciphers and aesni_simd_skciphers2 static
Message-Id: <20170820213438.14686-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Arrays aesni_simd_skciphers and aesni_simd_skciphers2 are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'aesni_simd_skciphers' was not declared. Should it be static?
symbol 'aesni_simd_skciphers2' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/crypto/aesni-intel_glue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 5c15d6b57329..c4c20286f27e 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -1067,9 +1067,10 @@ static struct skcipher_alg aesni_skciphers[] = {
 	}
 };
 
+static
 struct simd_skcipher_alg *aesni_simd_skciphers[ARRAY_SIZE(aesni_skciphers)];
 
-struct {
+static struct {
 	const char *algname;
 	const char *drvname;
 	const char *basename;
-- 
2.11.0

