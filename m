From: Colin King <colin.king@canonical.com>
Date: Sat, 14 Jul 2018 16:26:11 +0000
Subject: [PATCH] keys: trusted: remove redundant variable keyhndl
Message-Id: <20180714162611.8381-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <jejb@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable keyhndl is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'keyhndl' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/keys/trusted.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/keys/trusted.c b/security/keys/trusted.c
index b69d3b1777c2..0400c1a00467 100644
--- a/security/keys/trusted.c
+++ b/security/keys/trusted.c
@@ -585,7 +585,6 @@ static int tpm_unseal(struct tpm_buf *tb,
 	uint32_t authhandle2 = 0;
 	unsigned char cont = 0;
 	uint32_t ordinal;
-	uint32_t keyhndl;
 	int ret;
 
 	/* sessions for unsealing key and data */
@@ -601,7 +600,6 @@ static int tpm_unseal(struct tpm_buf *tb,
 	}
 
 	ordinal = htonl(TPM_ORD_UNSEAL);
-	keyhndl = htonl(SRKHANDLE);
 	ret = tpm_get_random(NULL, nonceodd, TPM_NONCE_SIZE);
 	if (ret != TPM_NONCE_SIZE) {
 		pr_info("trusted_key: tpm_get_random failed (%d)\n", ret);
-- 
2.17.1

