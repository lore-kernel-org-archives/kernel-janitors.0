From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Sep 2017 15:19:44 +0000
Subject: [PATCH] [media] cobalt: remove redundant zero check on retval
Message-Id: <20170905151944.20491-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error handling paths all end up with retval being non-zero,
so the check for retval being zero is always false and hence
is redundant. Remove it.

Detected by CoverityScan CID#1309479 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 98b6cb9505d1..8487ecaa4d30 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -767,8 +767,6 @@ static int cobalt_probe(struct pci_dev *pci_dev,
 err_wq:
 	destroy_workqueue(cobalt->irq_work_queues);
 err:
-	if (retval = 0)
-		retval = -ENODEV;
 	cobalt_err("error %d on initialization\n", retval);
 
 	v4l2_device_unregister(&cobalt->v4l2_dev);
-- 
2.14.1

