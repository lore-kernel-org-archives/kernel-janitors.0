From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2015 19:50:49 +0000
Subject: [patch] NVMe: Precedence error in nvme_pr_clear()
Message-Id: <20151103195049.GA17238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151103153958.GH13904@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code is equivalent to:

	u32 cdw10 = (1 | key) ? 1 << 3 : 0;

But we want:

	u32 cdw10 = 1 | (key ? 1 << 3 : 0);

Fixes: 1d277a637a71: ('NVMe: Add persistent reservation ops')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 34fae28..8bcb772 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2140,7 +2140,7 @@ static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
 
 static int nvme_pr_clear(struct block_device *bdev, u64 key)
 {
-	u32 cdw10 = 1 | key ? 1 << 3 : 0;
+	u32 cdw10 = 1 | (key ? 1 << 3 : 0);
 	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_register);
 }
 
