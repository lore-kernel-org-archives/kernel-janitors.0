From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jan 2017 18:44:45 +0000
Subject: [PATCH] evm: Move two error code assignments in evm_set_key()
Message-Id: <a9edf310-0edb-0dc7-f623-164ee9c7f102@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ima-devel@lists.sourceforge.net, linux-security-module@vger.kernel.org, James Morris <james.l.morris@oracle.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jan 2017 19:37:20 +0100

A local variable was set to an error code in two cases before a concrete
error situation was detected. Thus move the corresponding assignments into
if branches to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/evm/evm_crypto.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
index d7f282d75cc1..71bc204e2ee8 100644
--- a/security/integrity/evm/evm_crypto.c
+++ b/security/integrity/evm/evm_crypto.c
@@ -53,12 +53,14 @@ int evm_set_key(void *key, size_t keylen)
 {
 	int rc;
 
-	rc = -EBUSY;
-	if (test_and_set_bit(EVM_SET_KEY_BUSY, &evm_set_key_flags))
+	if (test_and_set_bit(EVM_SET_KEY_BUSY, &evm_set_key_flags)) {
+		rc = -EBUSY;
 		goto busy;
-	rc = -EINVAL;
-	if (keylen > MAX_KEY_SIZE)
+	}
+	if (keylen > MAX_KEY_SIZE) {
+		rc = -EINVAL;
 		goto inval;
+	}
 	memcpy(evmkey, key, keylen);
 	evm_initialized |= EVM_INIT_HMAC;
 	pr_info("key initialized\n");
-- 
2.11.0

