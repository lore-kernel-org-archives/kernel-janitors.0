From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 14:11:31 +0000
Subject: [PATCH] apparmor: clean an indentation issue, remove extraneous space
Message-Id: <20181030141131.3258-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove space

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/apparmor/apparmorfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 658b85639006..33f89b3f28a4 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1744,7 +1744,7 @@ static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
 	if (error)
 		return error;
 
-	 parent = aa_get_ns(dir->i_private);
+	parent = aa_get_ns(dir->i_private);
 	/* rmdir calls the generic securityfs functions to remove files
 	 * from the apparmor dir. It is up to the apparmor ns locking
 	 * to avoid races.
-- 
2.19.1
