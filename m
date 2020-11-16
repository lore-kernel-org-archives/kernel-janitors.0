From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 16 Nov 2020 07:00:35 +0000
Subject: [PATCH] scsi: sd: remove obsolete variable in sd_remove()
Message-Id: <20201116070035.11870-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, "Martin K . Petersen" <martin.petersen@oracle.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 140ea3bbf39a ("sd: use __register_blkdev to avoid a modprobe for an
unregistered dev_t") removed blk_register_region(devt, ...) in sd_remove()
and since then, devt is unused in sd_remove().

Hence, make W=1 warns:

  drivers/scsi/sd.c:3516:8:
      warning: variable 'devt' set but not used [-Wunused-but-set-variable]

Simply remove this obsolete variable.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201113

Christoph, Hannes, please ack.

Martin, James, please pick this minor non-urgent clean-up patch.

 drivers/scsi/sd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 106a9cda0eb7..82d0cb97b758 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3513,10 +3513,8 @@ static int sd_probe(struct device *dev)
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
