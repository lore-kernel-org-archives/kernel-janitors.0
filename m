From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 06:54:05 +0000
Subject: [PATCH] binfmt_flat: Delete two error messages for a failed memory allocation in decompress_exec()
Message-Id: <f92aac79-b05e-321a-1a19-d38c7159ee9c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 08:43:50 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/binfmt_flat.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 604a176df0c2..ce6537c50ec1 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -192,13 +192,11 @@ static int decompress_exec(
 
 	memset(&strm, 0, sizeof(strm));
 	strm.workspace = kmalloc(zlib_inflate_workspacesize(), GFP_KERNEL);
-	if (strm.workspace = NULL) {
-		pr_debug("no memory for decompress workspace\n");
+	if (!strm.workspace)
 		return -ENOMEM;
-	}
+
 	buf = kmalloc(LBUFSIZE, GFP_KERNEL);
-	if (buf = NULL) {
-		pr_debug("no memory for read buffer\n");
+	if (!buf) {
 		retval = -ENOMEM;
 		goto out_free;
 	}
-- 
2.14.0

