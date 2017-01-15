From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:01:11 +0000
Subject: [PATCH 04/46] selinux: Use kmalloc_array() in hashtab_create()
Message-Id: <66451d7e-f9ff-1d53-e919-d237a24ca8a2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 12:06:13 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/hashtab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/hashtab.c b/security/selinux/ss/hashtab.c
index 2cc496149842..dc99fff64ecb 100644
--- a/security/selinux/ss/hashtab.c
+++ b/security/selinux/ss/hashtab.c
@@ -24,7 +24,7 @@ struct hashtab *hashtab_create(u32 (*hash_value)(struct hashtab *h, const void *
 	p->nel = 0;
 	p->hash_value = hash_value;
 	p->keycmp = keycmp;
-	p->htable = kmalloc(sizeof(*(p->htable)) * size, GFP_KERNEL);
+	p->htable = kmalloc_array(size, sizeof(*p->htable), GFP_KERNEL);
 	if (p->htable = NULL) {
 		kfree(p);
 		return NULL;
-- 
2.11.0

