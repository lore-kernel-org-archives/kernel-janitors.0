From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 10:52:10 +0000
Subject: [PATCH] block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_init(
Message-Id: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 12:37:01 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/ps3vram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index e0e81cacd781..ba97d037279e 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -409,10 +409,8 @@ static int ps3vram_cache_init(struct ps3_system_bus_device *dev)
 	priv->cache.page_size = CACHE_PAGE_SIZE;
 	priv->cache.tags = kzalloc(sizeof(struct ps3vram_tag) *
 				   CACHE_PAGE_COUNT, GFP_KERNEL);
-	if (priv->cache.tags = NULL) {
-		dev_err(&dev->core, "Could not allocate cache tags\n");
+	if (!priv->cache.tags)
 		return -ENOMEM;
-	}
 
 	dev_info(&dev->core, "Created ram cache: %d entries, %d KiB each\n",
 		CACHE_PAGE_COUNT, CACHE_PAGE_SIZE / 1024);
-- 
2.13.4

