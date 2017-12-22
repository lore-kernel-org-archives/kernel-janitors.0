From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 17:01:22 +0000
Subject: [PATCH] tee: shm: make function __tee_shm_alloc static
Message-Id: <20171222170122.30477-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function __tee_shm_alloc is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol '__tee_shm_alloc' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tee/tee_shm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 04e1b8b37046..13b4de1157c7 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -112,9 +112,9 @@ static const struct dma_buf_ops tee_shm_dma_buf_ops = {
 	.mmap = tee_shm_op_mmap,
 };
 
-struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
-				struct tee_device *teedev,
-				size_t size, u32 flags)
+static struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
+				       struct tee_device *teedev,
+				       size_t size, u32 flags)
 {
 	struct tee_shm_pool_mgr *poolm = NULL;
 	struct tee_shm *shm;
-- 
2.14.1

