From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 09:09:58 +0000
Subject: [PATCH] smack: Fix a memory leak in smack_add_opt()
Message-Id: <20181221090958.GE2735@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Casey Schaufler <casey@schaufler-ca.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The function is leaking "opts" on the error paths.

Fixes: 90e3b564ab93 ("smack: take the guts of smack_parse_opts_str() into a new helper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 security/smack/smack_lsm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 2adafc1018d9..4e9cdb942677 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -604,13 +604,13 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
 {
 	struct smack_mnt_opts *opts = *mnt_opts;
 
+	if (!s)
+		return -ENOMEM;
 	if (!opts) {
 		opts = kzalloc(sizeof(struct smack_mnt_opts), GFP_KERNEL);
 		if (!opts)
 			return -ENOMEM;
 	}
-	if (!s)
-		return -ENOMEM;
 
 	switch (token) {
 	case Opt_fsdefault:
@@ -643,6 +643,8 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
 	return 0;
 
 out_opt_err:
+	if (opts != *mnt_opts)
+		kfree(opts);
 	pr_warn("Smack: duplicate mount options\n");
 	return -EINVAL;
 }
-- 
2.17.1
