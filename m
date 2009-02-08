From: Julia Lawall <julia@diku.dk>
Date: Sun, 08 Feb 2009 21:46:21 +0000
Subject: [PATCH 6/6] kernel/cred.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0902082245540.25891@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jmorris@namei.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.
To avoid adding more #ifdefs, the allocation is just moved below the error
handling code.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 kernel/cred.c   |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index 3a03918..62e909b 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -219,18 +219,20 @@ struct cred *prepare_usermodehelper_creds(void)
 #endif
 	struct cred *new;
 
-#ifdef CONFIG_KEYS
-	tgcred = kzalloc(sizeof(*new->tgcred), GFP_ATOMIC);
-	if (!tgcred)
-		return NULL;
-#endif
-
 	new = kmem_cache_alloc(cred_jar, GFP_ATOMIC);
 	if (!new)
 		return NULL;
 
 	memcpy(new, &init_cred, sizeof(struct cred));
 
+#ifdef CONFIG_KEYS
+	tgcred = kzalloc(sizeof(*new->tgcred), GFP_ATOMIC);
+	if (!tgcred) {
+		kmem_cache_free(cred_jar, new);
+		return NULL;
+	}
+#endif
+
 	atomic_set(&new->usage, 1);
 	get_group_info(new->group_info);
 	get_uid(new->user);
