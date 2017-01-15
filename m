From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:22:11 +0000
Subject: [PATCH 22/46] selinux: Delete an unnecessary variable initialisation in range_read()
Message-Id: <d5af857a-d19d-265a-2378-3e98b176c5ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 20:40:12 +0100

The local variable "rt" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning which became
unnecessary with a previous update step.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 0d2f64558c0a..6121a26ada64 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -1839,7 +1839,7 @@ u32 string_to_av_perm(struct policydb *p, u16 tclass, const char *name)
 
 static int range_read(struct policydb *p, void *fp)
 {
-	struct range_trans *rt = NULL;
+	struct range_trans *rt;
 	struct mls_range *r = NULL;
 	int i, rc;
 	__le32 buf[2];
-- 
2.11.0

