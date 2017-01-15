From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:15:06 +0000
Subject: [PATCH 15/46] selinux: One check and function call less in genfs_read() after error detection
Message-Id: <dbd8e89d-45a1-5785-f2dd-673389ac01a3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 18:29:20 +0100

Adjust a jump target to avoid a check repetition at the end after a memory
allocation failed for the local variable "newgenfs".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 5dc31faa601f..e7b882251da8 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2015,7 +2015,7 @@ static int genfs_read(struct policydb *p, void *fp)
 		newgenfs = kzalloc(sizeof(*newgenfs), GFP_KERNEL);
 		if (!newgenfs) {
 			rc = -ENOMEM;
-			goto out;
+			goto exit;
 		}
 
 		rc = str_read(&newgenfs->fstype, GFP_KERNEL, fp, len);
@@ -2101,7 +2101,7 @@ static int genfs_read(struct policydb *p, void *fp)
 		kfree(newgenfs);
 	}
 	ocontext_destroy(newc, OCON_FSUSE);
-
+exit:
 	return rc;
 }
 
-- 
2.11.0

