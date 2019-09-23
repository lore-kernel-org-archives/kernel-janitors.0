From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2019 14:18:36 +0000
Subject: [PATCH] nvme: fix an error code in nvme_init_subsystem()
Message-Id: <20190923141836.GA31251@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org

"ret" should be a negative error code here, but it's either success or
possibly uninitialized.

Fixes: 32fd90c40768 ("nvme: change locking for the per-subsystem controller list")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvme/host/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 63b37d08ac98..f6acbff3e3bc 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2540,8 +2540,9 @@ static int nvme_init_subsystem(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
 		list_add_tail(&subsys->entry, &nvme_subsystems);
 	}
 
-	if (sysfs_create_link(&subsys->dev.kobj, &ctrl->device->kobj,
-			dev_name(ctrl->device))) {
+	ret = sysfs_create_link(&subsys->dev.kobj, &ctrl->device->kobj,
+				dev_name(ctrl->device));
+	if (ret) {
 		dev_err(ctrl->device,
 			"failed to create sysfs link from subsystem.\n");
 		goto out_put_subsystem;
-- 
2.20.1
