From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Dec 2009 09:16:51 +0000
Subject: [PATCH 5/5] security/selinux/ss: correct size computation
Message-Id: <Pine.LNX.4.64.0912061016310.20858@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smalley <sds@tycho.nsa.gov>, James Morris <jmorris@namei.org>, Eric Paris <eparis@parisplace.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The size argument to kcalloc should be the size of desired structure,
not the pointer to it.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression *x;
@@

x  <+...
-sizeof(x)
+sizeof(*x)
...+>// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 security/selinux/ss/services.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/security/selinux/ss/services.c b/security/selinux/ss/services.c
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2555,7 +2555,7 @@ int security_get_classes(char ***classes
 	read_lock(&policy_rwlock);
 
 	*nclasses = policydb.p_classes.nprim;
-	*classes = kcalloc(*nclasses, sizeof(*classes), GFP_ATOMIC);
+	*classes = kcalloc(*nclasses, sizeof(**classes), GFP_ATOMIC);
 	if (!*classes)
 		goto out;
 
@@ -2602,7 +2602,7 @@ int security_get_permissions(char *class
 	}
 
 	*nperms = match->permissions.nprim;
-	*perms = kcalloc(*nperms, sizeof(*perms), GFP_ATOMIC);
+	*perms = kcalloc(*nperms, sizeof(**perms), GFP_ATOMIC);
 	if (!*perms)
 		goto out;
 
