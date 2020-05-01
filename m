From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Fri, 01 May 2020 19:51:11 +0000
Subject: [PATCH] selinux: fix return value on error in policydb_read()
Message-Id: <20200501195111.3335258-1-omosnace@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

The value of rc is still zero from the last assignment when the error
path is taken. Fix it by setting it to -ENOMEM before the
hashtab_create() call.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/ss/policydb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 1c0041576643..9f7ce3e037d1 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2540,6 +2540,7 @@ int policydb_read(struct policydb *p, void *fp)
 		goto bad;
 	nel = le32_to_cpu(buf[0]);
 
+	rc = -ENOMEM;
 	p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
 	if (!p->role_tr)
 		goto bad;
-- 
2.25.4
