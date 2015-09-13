From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:04 +0000
Subject: [PATCH 11/39] hfi1: drop null test before destroy functions
Message-Id: <1442146532-9100-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath@intel.com>
Cc: devel@driverdev.osuosl.org, linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rdma/hfi1/user_sdma.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rdma/hfi1/user_sdma.c b/drivers/staging/rdma/hfi1/user_sdma.c
index 5552661..6620262 100644
--- a/drivers/staging/rdma/hfi1/user_sdma.c
+++ b/drivers/staging/rdma/hfi1/user_sdma.c
@@ -486,8 +486,7 @@ int hfi1_user_sdma_free_queues(struct hfi1_filedata *fd)
 			}
 			kfree(pq->reqs);
 		}
-		if (pq->txreq_cache)
-			kmem_cache_destroy(pq->txreq_cache);
+		kmem_cache_destroy(pq->txreq_cache);
 		kfree(pq);
 		fd->pq = NULL;
 	}

