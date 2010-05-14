From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 May 2010 19:30:30 +0000
Subject: [PATCH 7/10] security/selinux/ss: Use kstrdup
Message-Id: <Pine.LNX.4.64.1005142130140.28935@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smalley <sds@tycho.nsa.gov>, James Morris <jmorris@namei.org>, Eric Paris <eparis@parisplace.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kstrdup when the goal of an allocation is copy a string into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to;
expression flag,E1,E2;
statement S;
@@

-  to = kmalloc(strlen(from) + 1,flag);
+  to = kstrdup(from, flag);
   ... when != \(from = E1 \| to = E1 \)
   if (to=NULL || ...) S
   ... when != \(from = E2 \| to = E2 \)
-  strcpy(to, from);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 security/selinux/ss/policydb.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -156,12 +156,11 @@ static int roles_init(struct policydb *p
 		rc = -EINVAL;
 		goto out_free_role;
 	}
-	key = kmalloc(strlen(OBJECT_R) + 1, GFP_KERNEL);
+	key = kstrdup(OBJECT_R, GFP_KERNEL);
 	if (!key) {
 		rc = -ENOMEM;
 		goto out_free_role;
 	}
-	strcpy(key, OBJECT_R);
 	rc = hashtab_insert(p->p_roles.table, key, role);
 	if (rc)
 		goto out_free_key;
