From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:11:15 +0000
Subject: [PATCH 11/46] selinux: Return directly after a failed next_entry() in genfs_read()
Message-Id: <767b0ef6-2693-2de3-897f-c1989870676f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 16:34:25 +0100

Return directly after a call of the function "next_entry" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 506b0228d1f1..754f829d2027 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2004,7 +2004,7 @@ static int genfs_read(struct policydb *p, void *fp)
 
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc)
-		goto out;
+		return rc;
 	nel = le32_to_cpu(buf[0]);
 
 	for (i = 0; i < nel; i++) {
-- 
2.11.0

