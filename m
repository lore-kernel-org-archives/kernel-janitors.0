From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 10:00:15 +0000
Subject: [PATCH] hfsplus: Delete an error message for a failed memory allocation in hfsplus_create_attributes
Message-Id: <7c98ed1d-24a1-2bd9-6302-3d4de9d9943c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 11:34:48 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/hfsplus/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index d37bb88dc746..b921eeb8cc31 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -209,7 +209,6 @@ static int hfsplus_create_attributes_file(struct super_block *sb)
 
 	buf = kzalloc(node_size, GFP_NOFS);
 	if (!buf) {
-		pr_err("failed to allocate memory for header node\n");
 		err = -ENOMEM;
 		goto end_attr_file_creation;
 	}
-- 
2.14.0

