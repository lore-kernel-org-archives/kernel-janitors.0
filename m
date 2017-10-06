From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 06 Oct 2017 15:12:10 +0000
Subject: [PATCH] kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Oct 2017 16:27:26 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/module.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index de66ec825992..07ef44767245 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -837,10 +837,8 @@ static int add_module_usage(struct module *a, struct module *b)
 
 	pr_debug("Allocating new usage for %s.\n", a->name);
 	use = kmalloc(sizeof(*use), GFP_ATOMIC);
-	if (!use) {
-		pr_warn("%s: out of memory loading\n", a->name);
+	if (!use)
 		return -ENOMEM;
-	}
 
 	use->source = a;
 	use->target = b;
-- 
2.14.2

