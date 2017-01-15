From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:14:04 +0000
Subject: [PATCH 14/46] selinux: One function call less in genfs_read() after null pointer detection
Message-Id: <202d7312-b266-ce9d-8f7a-3e8282c7b0c5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 17:43:47 +0100

Call the function "kfree" at the end only after it was determined
that the local variable "newgenfs" contained a non-null pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index a12d9166f0e4..5dc31faa601f 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2096,9 +2096,10 @@ static int genfs_read(struct policydb *p, void *fp)
 	}
 	rc = 0;
 out:
-	if (newgenfs)
+	if (newgenfs) {
 		kfree(newgenfs->fstype);
-	kfree(newgenfs);
+		kfree(newgenfs);
+	}
 	ocontext_destroy(newc, OCON_FSUSE);
 
 	return rc;
-- 
2.11.0

