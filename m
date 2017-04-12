From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Apr 2017 14:04:13 +0000
Subject: [PATCH] [media] xc5000: fix spelling mistake: "calibration"
Message-Id: <20170412140413.17823-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake on calibration, make Self lowercase
and re-join multiple lined printk since checkpatch allows this
coding style.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/tuners/xc5000.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index 91947cf1950e..e823aafce276 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1184,8 +1184,7 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe, int force)
 		/* Start the tuner self-calibration process */
 		ret = xc_initialize(priv);
 		if (ret) {
-			printk(KERN_ERR
-			       "xc5000: Can't request Self-callibration.");
+			printk(KERN_ERR "xc5000: Can't request self-calibration.");
 			continue;
 		}
 
-- 
2.11.0

