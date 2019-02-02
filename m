From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Feb 2019 22:34:49 +0000
Subject: [PATCH] staging: most: cdev: add missing check for cdev_add failure
Message-Id: <20190202223449.26554-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to cdev_add is missing a check for failure. Fix this by
checking for failure and exiting via a new error path that ensures the
allocated comp_channel struct is kfree'd.

Detected by CoverityScan, CID#1462359 ("Unchecked return value")

Fixes: 9bc79bbcd0c5 ("Staging: most: add MOST driver's aim-cdev module")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/cdev/cdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/cdev/cdev.c b/drivers/staging/most/cdev/cdev.c
index ea64aabda94e..f2b347cda8b7 100644
--- a/drivers/staging/most/cdev/cdev.c
+++ b/drivers/staging/most/cdev/cdev.c
@@ -453,7 +453,9 @@ static int comp_probe(struct most_interface *iface, int channel_id,
 	c->devno = MKDEV(comp.major, current_minor);
 	cdev_init(&c->cdev, &channel_fops);
 	c->cdev.owner = THIS_MODULE;
-	cdev_add(&c->cdev, c->devno, 1);
+	retval = cdev_add(&c->cdev, c->devno, 1);
+	if (retval < 0)
+		goto err_free_c;
 	c->iface = iface;
 	c->cfg = cfg;
 	c->channel_id = channel_id;
@@ -485,6 +487,7 @@ static int comp_probe(struct most_interface *iface, int channel_id,
 	list_del(&c->list);
 err_del_cdev_and_free_channel:
 	cdev_del(&c->cdev);
+err_free_c:
 	kfree(c);
 err_remove_ida:
 	ida_simple_remove(&comp.minor_id, current_minor);
-- 
2.20.1
