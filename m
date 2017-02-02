From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Feb 2017 12:12:02 +0000
Subject: [PATCH 2/2] staging: rts5208: remove unncessary result set and check, just return SUCCESS
Message-Id: <20170202121202.29659-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170202121202.29659-1-colin.king@canonical.com>
In-Reply-To: <20170202121202.29659-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wayne Porter <wporter82@gmail.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Quentin Lambert <lambert.quentin@gmail.com>, Dilek Uzulmez <dilekuzulmez@gmail.com>, Jonas Rickert <jrickertkc@gmail.com>, MingChia Chung <quexint@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Minor clean up, there is no need to assign result to zero, then
check if it is less than zero. Just return SUCCESS.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 68d75d0..b8177f5 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -198,23 +198,21 @@ static int command_abort(struct scsi_cmnd *srb)
  */
 static int device_reset(struct scsi_cmnd *srb)
 {
-	int result = 0;
 	struct rtsx_dev *dev = host_to_rtsx(srb->device->host);
 
 	dev_info(&dev->pci->dev, "%s called\n", __func__);
 
-	return result < 0 ? FAILED : SUCCESS;
+	return SUCCESS;
 }
 
 /* Simulate a SCSI bus reset by resetting the device's USB port. */
 static int bus_reset(struct scsi_cmnd *srb)
 {
-	int result = 0;
 	struct rtsx_dev *dev = host_to_rtsx(srb->device->host);
 
 	dev_info(&dev->pci->dev, "%s called\n", __func__);
 
-	return result < 0 ? FAILED : SUCCESS;
+	return SUCCESS;
 }
 
 /*
-- 
2.10.2

