From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:34:03 +0000
Subject: [PATCH 34/46] selinux: Return directly after a failed kzalloc() in common_read()
Message-Id: <caec05bb-b2ae-eda6-f052-32ed1d7c8c47@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 11:15:19 +0100

Return directly after a call of the function "kzalloc" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 9035e5329ceb..551685283399 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -1150,10 +1150,9 @@ static int common_read(struct policydb *p, struct hashtab *h, void *fp)
 	u32 len, nel;
 	int i, rc;
 
-	rc = -ENOMEM;
 	comdatum = kzalloc(sizeof(*comdatum), GFP_KERNEL);
 	if (!comdatum)
-		goto bad;
+		return -ENOMEM;
 
 	rc = next_entry(buf, fp, sizeof buf);
 	if (rc)
-- 
2.11.0

