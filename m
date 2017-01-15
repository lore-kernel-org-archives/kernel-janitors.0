From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:17:03 +0000
Subject: [PATCH 17/46] selinux: Delete an unnecessary variable assignment in filename_trans_read()
Message-Id: <71120ef7-6463-6497-f915-fcaf9e54239d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 19:02:42 +0100

The local variable "ft" was set to a null pointer despite of an
immediate reassignment.
Thus remove this statement from the beginning of a loop.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 106a1da1d68a..2be5b18eb149 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -1927,7 +1927,6 @@ static int filename_trans_read(struct policydb *p, void *fp)
 	nel = le32_to_cpu(buf[0]);
 
 	for (i = 0; i < nel; i++) {
-		ft = NULL;
 		otype = NULL;
 		name = NULL;
 		ft = kzalloc(sizeof(*ft), GFP_KERNEL);
-- 
2.11.0

