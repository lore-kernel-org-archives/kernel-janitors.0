From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 10:24:06 +0000
Subject: [patch] nvme: precedence bug in nvme_pr_clear()
Message-Id: <20151209102406.GD3173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "|" operator has higher precedence than "?:" so this didn't work as
intended.  I had previously fixed this bug, but it we copied the older
unfixed version when we moved the function between files.

Fixes: 1673f1f08c88 ('nvme: move block_device_operations and ns/ctrl freeing to common code')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f9c4e80..b8dc123 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -671,7 +671,7 @@ static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
 
 static int nvme_pr_clear(struct block_device *bdev, u64 key)
 {
-	u32 cdw10 = 1 | key ? 1 << 3 : 0;
+	u32 cdw10 = 1 | (key ? 1 << 3 : 0);
 	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_register);
 }
 
