From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2019 11:07:39 +0000
Subject: [PATCH] scsi: smartpqi: unlock on error in pqi_submit_raid_request_synchronous()
Message-Id: <20190529110739.GD19119@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to drop the "ctrl_info->sync_request_sem" lock before returning.

Fixes: 6c223761eb54 ("smartpqi: initial commit of Microsemi smartpqi driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index b17761eafca9..e57f3f3836ba 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -4046,8 +4046,10 @@ static int pqi_submit_raid_request_synchronous(struct pqi_ctrl_info *ctrl_info,
 				return -ETIMEDOUT;
 			msecs_blocked  				jiffies_to_msecs(jiffies - start_jiffies);
-			if (msecs_blocked >= timeout_msecs)
-				return -ETIMEDOUT;
+			if (msecs_blocked >= timeout_msecs) {
+				rc = -ETIMEDOUT;
+				goto out;
+			}
 			timeout_msecs -= msecs_blocked;
 		}
 	}
-- 
2.20.1
