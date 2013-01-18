From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 07:43:09 +0000
Subject: [patch] module: potential deadlock in error path
Message-Id: <20130118074309.GB31793@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We take the lock twice if we hit this goto.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/module.c b/kernel/module.c
index d25e359..2eefa7d 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3239,8 +3239,10 @@ again:
 	mutex_lock(&module_mutex);
 	/* Find duplicate symbols (must be called under lock). */
 	err = verify_export_symbols(mod);
-	if (err < 0)
+	if (err < 0) {
+		mutex_unlock(&module_mutex);
 		goto ddebug_cleanup;
+	}
 
 	/* This relies on module_mutex for list integrity. */
 	module_bug_finalize(info->hdr, info->sechdrs, mod);
