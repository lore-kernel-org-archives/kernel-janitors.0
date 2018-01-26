From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 19:42:47 +0000
Subject: [PATCH] orangefs: replace vmalloc and memset with vzalloc
Message-Id: <20180126194247.15166-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use vzalloc instead of the vmalloc, memset combo

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/devorangefs-req.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/orangefs/devorangefs-req.c b/fs/orangefs/devorangefs-req.c
index f073cd9e6687..a50fb8969e0a 100644
--- a/fs/orangefs/devorangefs-req.c
+++ b/fs/orangefs/devorangefs-req.c
@@ -463,11 +463,10 @@ static ssize_t orangefs_devreq_write_iter(struct kiocb *iocb,
 	if (op->downcall.type != ORANGEFS_VFS_OP_READDIR)
 		goto wakeup;
 
-	op->downcall.trailer_buf = vmalloc(op->downcall.trailer_size);
+	op->downcall.trailer_buf = vzalloc(op->downcall.trailer_size);
 	if (!op->downcall.trailer_buf)
 		goto Enomem;
 
-	memset(op->downcall.trailer_buf, 0, op->downcall.trailer_size);
 	if (!copy_from_iter_full(op->downcall.trailer_buf,
 			         op->downcall.trailer_size, iter)) {
 		gossip_err("%s: failed to copy trailer.\n", __func__);
-- 
2.15.1

