From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 12:37:26 +0000
Subject: [PATCH] habanalabs: fix error code in unmap_device_va()
Message-Id: <20200528123726.GB1219412@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omer Shpigelman <oshpigelman@habana.ai>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "rc" can be uninitialized on certain paths.

Fixes: 8ff5f4fd40df ("habanalabs: handle MMU cache invalidation timeout")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/habanalabs/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/memory.c b/drivers/misc/habanalabs/memory.c
index 4b8eed1ca5130..47da84a177197 100644
--- a/drivers/misc/habanalabs/memory.c
+++ b/drivers/misc/habanalabs/memory.c
@@ -1023,7 +1023,7 @@ static int unmap_device_va(struct hl_ctx *ctx, u64 vaddr, bool ctx_free)
 	struct hl_va_range *va_range;
 	enum vm_type_t *vm_type;
 	bool is_userptr;
-	int rc;
+	int rc = 0;
 
 	/* protect from double entrance */
 	mutex_lock(&ctx->mem_hash_lock);
-- 
2.26.2
