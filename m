From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:33:06 +0000
Subject: [PATCH 33/46] selinux: Move an assignment for the variable "rc" in class_read()
Message-Id: <d44c1a1e-fced-5dc5-f982-319d99f78b70@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 11:10:39 +0100

A local variable was set to an error code in one case before a concrete
error situation was detected. Thus move the corresponding assignment into
an if branch to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 3af2b0849495..9035e5329ceb 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -1345,10 +1345,10 @@ static int class_read(struct policydb *p, struct hashtab *h, void *fp)
 		if (rc)
 			goto bad;
 
-		rc = -EINVAL;
 		cladatum->comdatum = hashtab_search(p->p_commons.table, cladatum->comkey);
 		if (!cladatum->comdatum) {
 			printk(KERN_ERR "SELinux:  unknown common %s\n", cladatum->comkey);
+			rc = -EINVAL;
 			goto bad;
 		}
 	}
-- 
2.11.0

