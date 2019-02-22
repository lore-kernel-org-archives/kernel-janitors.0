From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 22 Feb 2019 05:46:01 +0000
Subject: [PATCH -next] habanalabs: use GFP_ATOMIC under spin lock
Message-Id: <20190222054601.4396-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omer Shpigelman <oshpigelman@habana.ai>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

A spin lock is taken here so we should use GFP_ATOMIC.

Fixes: 0feaf86d4e69 ("habanalabs: add virtual memory and MMU modules")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/misc/habanalabs/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/memory.c b/drivers/misc/habanalabs/memory.c
index 9236e52852c6..9e3491dc3b55 100644
--- a/drivers/misc/habanalabs/memory.c
+++ b/drivers/misc/habanalabs/memory.c
@@ -120,7 +120,7 @@ static int alloc_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args,
 
 	spin_lock(&vm->idr_lock);
 	handle = idr_alloc(&vm->phys_pg_pack_handles, phys_pg_pack, 1, 0,
-				GFP_KERNEL);
+				GFP_ATOMIC);
 	spin_unlock(&vm->idr_lock);
 
 	if (handle < 0) {
