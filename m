From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Mar 2012 08:29:03 +0000
Subject: [patch] KEYS: testing wrong bit for KEY_FLAG_REVOKED
Message-Id: <20120305082902.GA10894@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The test for "if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {"
should actually be "if (test_bit(KEY_FLAG_REVOKED, &req_key->flags)) {".
The current code actually checks for KEY_FLAG_DEAD.

The patch is really a one liner but I introduced a new variable so that
I don't go over the 80 character limit.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 1068cb1..3185ec3 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -537,6 +537,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 {
 	struct request_key_auth *rka;
 	const struct cred *cred;
+	struct key *req_key;
 	struct key *key;
 	key_ref_t key_ref, skey_ref;
 	int ret;
@@ -653,19 +654,20 @@ try_again:
 		break;
 
 	case KEY_SPEC_REQUESTOR_KEYRING:
-		if (!cred->request_key_auth)
+		req_key = cred->request_key_auth;
+		if (!req_key)
 			goto error;
 
-		down_read(&cred->request_key_auth->sem);
-		if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {
+		down_read(&req_key->sem);
+		if (test_bit(KEY_FLAG_REVOKED, &req_key->flags)) {
 			key_ref = ERR_PTR(-EKEYREVOKED);
 			key = NULL;
 		} else {
-			rka = cred->request_key_auth->payload.data;
+			rka = req_key->payload.data;
 			key = rka->dest_keyring;
 			atomic_inc(&key->usage);
 		}
-		up_read(&cred->request_key_auth->sem);
+		up_read(&req_key->sem);
 		if (!key)
 			goto error;
 		key_ref = make_key_ref(key, 1);
