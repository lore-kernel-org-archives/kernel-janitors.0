From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:21:42 +0000
Subject: [PATCH] integrity: remove redundant assignment to variable ret
Message-Id: <20200424112142.12261-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/integrity/digsig_asymmetric.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
index 4e0d6778277e..cfa4127d0518 100644
--- a/security/integrity/digsig_asymmetric.c
+++ b/security/integrity/digsig_asymmetric.c
@@ -79,7 +79,7 @@ int asymmetric_verify(struct key *keyring, const char *sig,
 	struct public_key_signature pks;
 	struct signature_v2_hdr *hdr = (struct signature_v2_hdr *)sig;
 	struct key *key;
-	int ret = -ENOMEM;
+	int ret;
 
 	if (siglen <= sizeof(*hdr))
 		return -EBADMSG;
-- 
2.25.1
