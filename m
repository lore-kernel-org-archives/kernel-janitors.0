From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 12:27:50 +0000
Subject: [PATCH][next] smack: fix two memory leaks in smack_add_opt
Message-Id: <20181222122750.13075-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Casey Schaufler <casey@schaufler-ca.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if s is null or when returning via the error exit label
out_opt_err leaks of the allocated opts can occur. Fix the leak
on the null s case by checking s is null before the allocation. Fix
the leak on the exit path by checking if opts was allocated by
kfree'ing opts.

Detected by CoverityScan, CID#1475953 ("Resource leak")

Fixes: b2130173efae ("smack: take the guts of smack_parse_opts_str() into a new helper")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/smack/smack_lsm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 84f72116a027..b5dc520adaa2 100644
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
@@ -644,6 +644,8 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
 
 out_opt_err:
 	pr_warn("Smack: duplicate mount options\n");
+	if (opts != *mnt_opts)
+		kfree(opts);
 	return -EINVAL;
 }
 
-- 
2.19.1
