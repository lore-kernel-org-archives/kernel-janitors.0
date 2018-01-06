From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 06 Jan 2018 09:22:30 +0000
Subject: [PATCH] tee: shm: Potential NULL dereference calling tee_shm_register()
Message-Id: <20180106092230.kwoztytj555muqg6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

get_user_pages_fast() can return zero in certain error paths.  We should
handle that or else it means we accidentally return ERR_PTR(0) which is
NULL instead of an error pointer.  The callers are not expecting that
and will crash with a NULL dereference.

Fixes: 033ddf12bcf5 ("tee: add register user memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 04e1b8b37046..cdeb4156acda 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -283,7 +283,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	if (rc > 0)
 		shm->num_pages = rc;
 	if (rc != num_pages) {
-		if (rc > 0)
+		if (rc >= 0)
 			rc = -ENOMEM;
 		ret = ERR_PTR(rc);
 		goto err;
