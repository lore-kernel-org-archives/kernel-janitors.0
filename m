From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 31 Aug 2019 13:03:48 +0000
Subject: [PATCH -next] scsi: smartpqi: remove set but not used variable 'ctrl_info'
Message-Id: <20190831130348.20552-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Murthy Bhat <Murthy.Bhat@microsemi.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_driver_version_show':
drivers/scsi/smartpqi/smartpqi_init.c:6164:24: warning:
 variable 'ctrl_info' set but not used [-Wunused-but-set-variable]

commit 6d90615f1346 ("scsi: smartpqi: add sysfs entries") add it but never
use, so remove it also variable 'shost'

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index ea5409bebf57..b9e7dabee1e5 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -6160,12 +6160,6 @@ static ssize_t pqi_firmware_version_show(struct device *dev,
 static ssize_t pqi_driver_version_show(struct device *dev,
 	struct device_attribute *attr, char *buffer)
 {
-	struct Scsi_Host *shost;
-	struct pqi_ctrl_info *ctrl_info;
-
-	shost = class_to_shost(dev);
-	ctrl_info = shost_to_hba(shost);
-
 	return snprintf(buffer, PAGE_SIZE,
 		"%s\n", DRIVER_VERSION BUILD_TIMESTAMP);
 }
