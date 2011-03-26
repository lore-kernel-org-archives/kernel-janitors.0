From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Mar 2011 01:51:12 +0000
Subject: [PATCH 2/6] [media] pvrusb2: fix remaining checkpatch.pl complaints
Message-Id: <20110326015112.GG2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

* Include <linux/string.h> instead of <asm/string.h>.
* Remove unneeded curly braces.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
index a5d4867..370a9ab 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
@@ -20,7 +20,7 @@
 
 #include "pvrusb2-std.h"
 #include "pvrusb2-debug.h"
-#include <asm/string.h>
+#include <linux/string.h>
 #include <linux/slab.h>
 
 struct std_name {
@@ -294,9 +294,8 @@ static struct v4l2_standard *match_std(v4l2_std_id id)
 	unsigned int idx;
 
 	for (idx = 0; idx < generic_standards_cnt; idx++) {
-		if (generic_standards[idx].id & id) {
+		if (generic_standards[idx].id & id)
 			return generic_standards + idx;
-		}
 	}
 	return NULL;
 }
