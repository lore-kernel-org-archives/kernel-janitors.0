From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2020 12:06:59 +0000
Subject: [PATCH] nvme: delete an unnecessary declaration
Message-Id: <20200515120659.GA575846@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>

The nvme_put_ctrl() is implemented earlier as an inline function so
this declaration isn't required.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvme/host/nvme.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index f3ab17778349..86f152e777bc 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -497,7 +497,6 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 void nvme_uninit_ctrl(struct nvme_ctrl *ctrl);
 void nvme_start_ctrl(struct nvme_ctrl *ctrl);
 void nvme_stop_ctrl(struct nvme_ctrl *ctrl);
-void nvme_put_ctrl(struct nvme_ctrl *ctrl);
 int nvme_init_identify(struct nvme_ctrl *ctrl);
 
 void nvme_remove_namespaces(struct nvme_ctrl *ctrl);
-- 
2.26.2
