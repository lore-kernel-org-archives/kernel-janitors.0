From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 10:42:56 +0000
Subject: [PATCH][next] selinux: fix allocation failure check on newpolicy->sidtab
Message-Id: <20200819104256.51499-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The allocation check of newpolicy->sidtab is null checking if
newpolicy is null and not newpolicy->sidtab. Fix this.

Addresses-Coverity: ("Logically dead code")
Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/selinux/ss/services.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index f6f78c65f53f..d310910fb639 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2224,7 +2224,7 @@ int security_load_policy(struct selinux_state *state, void *data, size_t len,
 		return -ENOMEM;
 
 	newpolicy->sidtab = kzalloc(sizeof(*newpolicy->sidtab), GFP_KERNEL);
-	if (!newpolicy)
+	if (!newpolicy->sidtab)
 		goto err;
 
 	rc = policydb_read(&newpolicy->policydb, fp);
-- 
2.27.0
