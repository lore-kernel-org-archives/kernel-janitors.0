From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:25:52 +0000
Subject: [PATCH] w1: ds1wm: fix spelling mistake "to" -> "too"
Message-Id: <20200123002552.2832419-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/w1/masters/ds1wm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/ds1wm.c b/drivers/w1/masters/ds1wm.c
index f661695fb589..39c66d9093c2 100644
--- a/drivers/w1/masters/ds1wm.c
+++ b/drivers/w1/masters/ds1wm.c
@@ -548,7 +548,7 @@ static int ds1wm_probe(struct platform_device *pdev)
 	/* make sure resource has space for 8 registers */
 	if ((8 << ds1wm_data->bus_shift) > resource_size(res)) {
 		dev_err(&ds1wm_data->pdev->dev,
-			"memory resource size %d to small, should be %d\n",
+			"memory resource size %d too small, should be %d\n",
 			(int)resource_size(res),
 			8 << ds1wm_data->bus_shift);
 		return -EINVAL;
-- 
2.24.0
