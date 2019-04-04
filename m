From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 04 Apr 2019 08:44:05 +0000
Subject: [PATCH] aio: use kmem_cache_free() instead of kfree()
Message-Id: <20190404084405.47992-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

memory allocated by kmem_cache_alloc() should be freed using
kmem_cache_free(), not kfree().

Fixes: fa0ca2aee3be ("deal with get_reqs_available() in aio_get_req() itself")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index a4cc2a1cccb7..93b1252d7f3c 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1034,7 +1034,7 @@ static inline struct aio_kiocb *aio_get_req(struct kioctx *ctx)
 		return NULL;
 
 	if (unlikely(!get_reqs_available(ctx))) {
-		kfree(req);
+		kmem_cache_free(kiocb_cachep, req);
 		return NULL;
 	}
