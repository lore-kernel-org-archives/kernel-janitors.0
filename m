From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 04 May 2019 06:55:00 +0000
Subject: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Message-Id: <20190504070430.57008-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

This issue was detected by using the Coccinelle software.

Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/misc/ocxl/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 8aa22893ed76..2870c25da166 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -257,8 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 		irq_id = ocxl_irq_offset_to_id(ctx, irq_fd.irq_offset);
 		ev_ctx = eventfd_ctx_fdget(irq_fd.eventfd);
-		if (!ev_ctx)
-			return -EFAULT;
+		if (IS_ERR(ev_ctx))
+			return PTR_ERR(ev_ctx);
 		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler, irq_free, ev_ctx);
 		break;
