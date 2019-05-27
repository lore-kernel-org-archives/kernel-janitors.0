From: Colin King <colin.king@canonical.com>
Date: Mon, 27 May 2019 17:52:26 +0000
Subject: [PATCH] smack: remove redundant assignment to variable m
Message-Id: <20190527175226.17191-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Casey Schaufler <casey@schaufler-ca.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable m is assigned a value that is never read and m is later
reassigned in for-loop.  This the assignment is redundant and can
be mored.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/smack/smackfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 47f73a0dabb1..b66adafeb5fa 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -1174,7 +1174,6 @@ static ssize_t smk_write_net4addr(struct file *file, const char __user *buf,
 			rc = -EINVAL;
 			goto free_out;
 		}
-		m = BEBITS;
 		masks = 32;
 	}
 	if (masks > BEBITS) {
-- 
2.20.1
