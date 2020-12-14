From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Dec 2020 09:54:24 +0000
Subject: [PATCH v2] scsi: sd: remove obsolete variable in sd_remove()
Message-Id: <20201214095424.12479-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 140ea3bbf39a ("sd: use __register_blkdev to avoid a modprobe for an
unregistered dev_t") removed blk_register_region(devt, ...) in sd_remove()
and since then, devt is unused in sd_remove().

Hence, make W=1 warns:

  drivers/scsi/sd.c:3516:8:
      warning: variable 'devt' set but not used [-Wunused-but-set-variable]

Simply remove this obsolete variable.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201113, next-20201211

The patch was submitted for inclusion in scsi:

  https://lore.kernel.org/lkml/20201116070035.11870-1-lukas.bulwahn@gmail.com/

v1 -> v2:

Christoph and Nathan reviewed, and I added the tags here.
Martin asked the patch to go through block.

Jens, can you please pick this minor non-urgent clean-up patch?

 drivers/scsi/sd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 679c2c025047..21675a98620d 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3510,10 +3510,8 @@ static int sd_probe(struct device *dev)
 static int sd_remove(struct device *dev)
 {
 	struct scsi_disk *sdkp;
-	dev_t devt;
 
 	sdkp = dev_get_drvdata(dev);
-	devt = disk_devt(sdkp->disk);
 	scsi_autopm_get_device(sdkp->device);
 
 	async_synchronize_full_domain(&scsi_sd_pm_domain);
-- 
2.17.1
