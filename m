From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Aug 2020 11:31:48 +0000
Subject: [PATCH] selinux: fix error handling bugs in security_load_policy()
Message-Id: <20200826113148.GA393664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Jeff Vander Stoep <jeffv@google.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are a few bugs in the error handling for security_load_policy().

1) If the newpolicy->sidtab allocation fails then it leads to a NULL
   dereference.  Also the error code was not set to -ENOMEM on that
   path.
2) If policydb_read() failed then we call policydb_destroy() twice
   which meands we call kvfree(p->sym_val_to_name[i]) twice.
3) If policydb_load_isids() failed then we call sidtab_destroy() twice
   and that results in a double free in the sidtab_destroy_tree()
   function because entry.ptr_inner and entry.ptr_leaf are not set to
   NULL.

One thing that makes this code nice to deal with is that none of the
functions return partially allocated data.  In other words, the
policydb_read() either allocates everything successfully or it frees
all the data it allocates.  It never returns a mix of allocated and
not allocated data.

I re-wrote this to only free the successfully allocated data which
avoids the double frees.  I also re-ordered selinux_policy_free() so
it's in the reverse order of the allocation function.

Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I was wrong about context_cpy().  There is no double free in the error
handling there.  Sorry about that.

 security/selinux/ss/services.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index a48fc1b337ba..645e436cdb85 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2127,10 +2127,10 @@ static void selinux_policy_free(struct selinux_policy *policy)
 	if (!policy)
 		return;
 
-	policydb_destroy(&policy->policydb);
 	sidtab_destroy(policy->sidtab);
-	kfree(policy->sidtab);
 	kfree(policy->map.mapping);
+	policydb_destroy(&policy->policydb);
+	kfree(policy->sidtab);
 	kfree(policy);
 }
 
@@ -2224,23 +2224,25 @@ int security_load_policy(struct selinux_state *state, void *data, size_t len,
 		return -ENOMEM;
 
 	newpolicy->sidtab = kzalloc(sizeof(*newpolicy->sidtab), GFP_KERNEL);
-	if (!newpolicy->sidtab)
-		goto err;
+	if (!newpolicy->sidtab) {
+		rc = -ENOMEM;
+		goto err_policy;
+	}
 
 	rc = policydb_read(&newpolicy->policydb, fp);
 	if (rc)
-		goto err;
+		goto err_sidtab;
 
 	newpolicy->policydb.len = len;
 	rc = selinux_set_mapping(&newpolicy->policydb, secclass_map,
 				&newpolicy->map);
 	if (rc)
-		goto err;
+		goto err_policydb;
 
 	rc = policydb_load_isids(&newpolicy->policydb, newpolicy->sidtab);
 	if (rc) {
 		pr_err("SELinux:  unable to load the initial SIDs\n");
-		goto err;
+		goto err_mapping;
 	}
 
 
@@ -2254,7 +2256,7 @@ int security_load_policy(struct selinux_state *state, void *data, size_t len,
 	rc = security_preserve_bools(state, &newpolicy->policydb);
 	if (rc) {
 		pr_err("SELinux:  unable to preserve booleans\n");
-		goto err;
+		goto err_free_isids;
 	}
 
 	/*
@@ -2279,13 +2281,23 @@ int security_load_policy(struct selinux_state *state, void *data, size_t len,
 		pr_err("SELinux:  unable to convert the internal"
 			" representation of contexts in the new SID"
 			" table\n");
-		goto err;
+		goto err_free_isids;
 	}
 
 	*newpolicyp = newpolicy;
 	return 0;
-err:
-	selinux_policy_free(newpolicy);
+
+err_free_isids:
+	sidtab_destroy(newpolicy->sidtab);
+err_mapping:
+	kfree(newpolicy->map.mapping);
+err_policydb:
+	policydb_destroy(&newpolicy->policydb);
+err_sidtab:
+	kfree(newpolicy->sidtab);
+err_policy:
+	kfree(newpolicy);
+
 	return rc;
 }
 
-- 
2.28.0
