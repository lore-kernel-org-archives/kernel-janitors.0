From: David Howells <dhowells@redhat.com>
Date: Tue, 06 Mar 2012 13:32:16 +0000
Subject: [PATCH] KEYS: testing wrong bit for KEY_FLAG_REVOKED
Message-Id: <20120306133215.17909.87599.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

The test for "if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {"
should actually testing that the (1 << KEY_FLAG_REVOKED) bit is set.
The current code actually checks for KEY_FLAG_DEAD.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/process_keys.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index b1cdb56..e137fcd 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -657,7 +657,8 @@ try_again:
 			goto error;
 
 		down_read(&cred->request_key_auth->sem);
-		if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {
+		if (test_bit(KEY_FLAG_REVOKED,
+			     &cred->request_key_auth->flags)) {
 			key_ref = ERR_PTR(-EKEYREVOKED);
 			key = NULL;
 		} else {

