From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 Feb 2015 10:38:05 +0000
Subject: [patch] paride: fix the "verbose" module param
Message-Id: <20150228103805.GA1771@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Waugh <tim@cyberelk.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The verbose module parameter can be set to 2 for extremely verbose
messages so the type should be int instead of bool.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/paride/pg.c b/drivers/block/paride/pg.c
index 2ce3dfd..876d0c3 100644
--- a/drivers/block/paride/pg.c
+++ b/drivers/block/paride/pg.c
@@ -137,7 +137,7 @@
 
 */
 
-static bool verbose = 0;
+static int verbose;
 static int major = PG_MAJOR;
 static char *name = PG_NAME;
 static int disable = 0;
@@ -168,7 +168,7 @@ enum {D_PRT, D_PRO, D_UNI, D_MOD, D_SLV, D_DLY};
 
 #include <asm/uaccess.h>
 
-module_param(verbose, bool, 0644);
+module_param(verbose, int, 0644);
 module_param(major, int, 0);
 module_param(name, charp, 0);
 module_param_array(drive0, int, NULL, 0);
