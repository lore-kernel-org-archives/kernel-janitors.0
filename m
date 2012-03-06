From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2012 12:36:26 +0000
Subject: [patch v2] KEYS: testing wrong bit for KEY_FLAG_REVOKED
Message-Id: <20120306123626.GA9868@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The test for "if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {"
should actually testing that the (1 << KEY_FLAG_REVOKED) bit is set.
The current code actually checks for KEY_FLAG_DEAD.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: the first patch introduced a new variable to avoid breaking the 80
    char limit.

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 1068cb1..eaeb0bd 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -657,7 +657,8 @@ try_again:
 			goto error;
 
 		down_read(&cred->request_key_auth->sem);
-		if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {
+		if (test_bit(KEY_FLAG_REVOKED,
+					&cred->request_key_auth->flags)) {
 			key_ref = ERR_PTR(-EKEYREVOKED);
 			key = NULL;
 		} else {
