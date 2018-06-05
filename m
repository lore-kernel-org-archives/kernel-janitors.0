From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 05 Jun 2018 09:16:21 +0000
Subject: [PATCH -next] ocxl: Fix missing unlock on error in afu_ioctl_enable_p9_wait()
Message-Id: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function
afu_ioctl_enable_p9_wait() in the error handling case.

Fixes: e948e06fc63a ("ocxl: Expose the thread_id needed for wait on POWER9")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/misc/ocxl/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 33ae46c..e6a6074 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -139,8 +139,10 @@ static long afu_ioctl_enable_p9_wait(struct ocxl_context *ctx,
 		// Locks both status & tidr
 		mutex_lock(&ctx->status_mutex);
 		if (!ctx->tidr) {
-			if (set_thread_tidr(current))
+			if (set_thread_tidr(current)) {
+				mutex_unlock(&ctx->status_mutex);
 				return -ENOENT;
+			}
 
 			ctx->tidr = current->thread.tidr;
 		}

