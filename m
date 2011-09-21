From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 07:12:50 +0000
Subject: [patch] mtip32xx: double free if copy_from_user() fails
Message-Id: <20110921071250.GE4999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Asai Thambi S P <asamymuthupa@micron.com>
Cc: Jens Axboe <jaxboe@fusionio.com>, Sam Bradshaw <sbradshaw@micron.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We call kfree(req_task) after we go to abort so it isn't needed here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 847b8ff..0d23d8c 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -1674,7 +1674,6 @@ static int exec_drive_taskfile(struct driver_data *dd,
 		intotal = compat_tasksize + req_task->out_size;
 	} else {
 		if (copy_from_user(req_task, buf, tasksize)) {
-			kfree(req_task);
 			err = -EFAULT;
 			goto abort;
 		}
