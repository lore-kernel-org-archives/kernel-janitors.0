From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:30:28 +0000
Subject: [PATCH] tee:  remove unnecessary NULL check in tee_shm_alloc()
Message-Id: <20200407093028.GK68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that "ctx" isn't checked consistently:

    drivers/tee/tee_shm.c:164 tee_shm_alloc()
    warn: variable dereferenced before check 'ctx' (see line 95)

I audited the callers and "ctx" can't be NULL so the check can be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tee/tee_shm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index bd679b72bd05..8895cb910166 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -161,8 +161,7 @@ struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 flags)
 		}
 	}
 
-	if (ctx)
-		teedev_ctx_get(ctx);
+	teedev_ctx_get(ctx);
 
 	return shm;
 err_rem:
-- 
2.25.1
