From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 10:57:32 +0000
Subject: [PATCH] nvme: remove an unnecessary condition
Message-Id: <20200714105732.GD294318@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>

"v" is an unsigned int so it can't be more than UINT_MAX.  Removing this
check makes it easier to preserve the error code as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvme/host/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 3d00ea4e7146..5fb5e8ba531b 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3586,8 +3586,8 @@ static ssize_t nvme_ctrl_reconnect_delay_store(struct device *dev,
 	int err;
 
 	err = kstrtou32(buf, 10, &v);
-	if (err || v > UINT_MAX)
-		return -EINVAL;
+	if (err)
+		return err;
 
 	ctrl->opts->reconnect_delay = v;
 	return count;
-- 
2.27.0
