From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 10:24:51 +0000
Subject: [patch] amdkfd: fix an error handling bug in pqm_create_queue()
Message-Id: <20141125102451.GC23215@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@amd.com>, Ben Goz <ben.goz@amd.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The call to kernel_queue_uninit(NULL) will trigger a BUG(), and also the
error code is incorrect.

Fixes: 45102048f77e ('amdkfd: Add process queue manager module')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index c7859fc..7ce7a25 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -208,7 +208,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 	case KFD_QUEUE_TYPE_DIQ:
 		kq = kernel_queue_init(dev, KFD_QUEUE_TYPE_DIQ);
 		if (kq = NULL) {
-			kernel_queue_uninit(kq);
+			retval = -ENOMEM;
 			goto err_create_queue;
 		}
 		kq->queue->properties.queue_id = *qid;
