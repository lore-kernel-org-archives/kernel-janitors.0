From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 11:02:56 +0000
Subject: [patch] [media] wl128x: fix typo in MODULE_PARM_DESC
Message-Id: <20160108110256.GJ32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Fabian Frederick <fabf@skynet.be>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The module_param() is "default_rds_buf" and the MODULE_PARM_DESC()
should match.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index ebc73b0..3f9e6df 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -68,7 +68,7 @@ MODULE_PARM_DESC(default_radio_region, "Region: 0=Europe/US, 1=Japan");
 /* RDS buffer blocks */
 static u32 default_rds_buf = 300;
 module_param(default_rds_buf, uint, 0444);
-MODULE_PARM_DESC(rds_buf, "RDS buffer entries");
+MODULE_PARM_DESC(default_rds_buf, "RDS buffer entries");
 
 /* Radio Nr */
 static u32 radio_nr = -1;
