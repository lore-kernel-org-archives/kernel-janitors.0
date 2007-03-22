From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 22 Mar 2007 15:08:18 +0000
Subject: [KJ] [PATCH] Fix minor typoes in kernel.module.c.
Message-Id: <Pine.LNX.4.64.0703221107110.30491@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Fix minor (comment) typoes in kernel/module.c.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/kernel/module.c b/kernel/module.c
index fbc51de..1afab7a 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -93,9 +93,9 @@ static inline void add_taint_module(struct module *mod, unsigned flag)
 	mod->taints |= flag;
 }

-/* A thread that wants to hold a reference to a module only while it
- * is running can call ths to safely exit.
- * nfsd and lockd use this.
+/*
+ * A thread that wants to hold a reference to a module only while it
+ * is running can call this to safely exit.  nfsd and lockd use this.
  */
 void __module_put_and_exit(struct module *mod, long code)
 {
@@ -1194,7 +1194,7 @@ static int __unlink_module(void *_mod)
 	return 0;
 }

-/* Free a module, remove from lists, etc (must hold module mutex). */
+/* Free a module, remove from lists, etc (must hold module_mutex). */
 static void free_module(struct module *mod)
 {
 	/* Delete from various lists */
@@ -1241,7 +1241,7 @@ EXPORT_SYMBOL_GPL(__symbol_get);

 /*
  * Ensure that an exported symbol [global namespace] does not already exist
- * in the Kernel or in some other modules exported symbol table.
+ * in the kernel or in some other module's exported symbol table.
  */
 static int verify_export_symbols(struct module *mod)
 {
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
