From: Dan Carpenter <error27@gmail.com>
Date: Tue, 09 Aug 2011 18:01:33 +0000
Subject: [patch] Staging: zcache: signedness bug in tmem_get()
Message-Id: <20110809180133.GB3830@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ret" needs to be signed for the error handling to work properly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/zcache/tmem.c b/drivers/staging/zcache/tmem.c
index 975e34b..1ca66ea 100644
--- a/drivers/staging/zcache/tmem.c
+++ b/drivers/staging/zcache/tmem.c
@@ -604,7 +604,7 @@ int tmem_get(struct tmem_pool *pool, struct tmem_oid *oidp, uint32_t index,
 	struct tmem_obj *obj;
 	void *pampd;
 	bool ephemeral = is_ephemeral(pool);
-	uint32_t ret = -1;
+	int ret = -1;
 	struct tmem_hashbucket *hb;
 	bool free = (get_and_free = 1) || ((get_and_free = 0) && ephemeral);
 	bool lock_held = false;
