From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 12:21:42 +0000
Subject: [PATCH 3/3] [media] WL1273: Delete an unnecessary variable initialisation in wl1273_fm_suspend()
Message-Id: <1725267e-7f27-a46b-9dd7-860c1734b15f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edf138b9-0d47-5074-3ff4-63831c44f196@users.sourceforge.net>
In-Reply-To: <edf138b9-0d47-5074-3ff4-63831c44f196@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Hans Verkuil <hansverk@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 13:55:56 +0200

The local variable "r" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-wl1273.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index 74dc3195ea2c..b8f08bfc31c3 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -671,6 +671,6 @@ static int wl1273_fm_start(struct wl1273_device *radio, int new_mode)
 static int wl1273_fm_suspend(struct wl1273_device *radio)
 {
 	struct wl1273_core *core = radio->core;
-	int r = 0;
+	int r;
 
 	/* Cannot go from OFF to SUSPENDED */
-- 
2.14.1

