From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 12:19:49 +0000
Subject: [PATCH 1/3] [media] WL1273: Delete an error message for a failed memory allocation in wl1273_fm_radi
Message-Id: <3cc3d260-6aed-3e39-24d1-9fcdf4a49685@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edf138b9-0d47-5074-3ff4-63831c44f196@users.sourceforge.net>
In-Reply-To: <edf138b9-0d47-5074-3ff4-63831c44f196@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Hans Verkuil <hansverk@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 13:28:38 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-wl1273.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index 903fcd5e99c0..020a792173f6 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -2034,5 +2034,4 @@ static int wl1273_fm_radio_probe(struct platform_device *pdev)
 	if (!radio->buffer) {
-		pr_err("Cannot allocate memory for RDS buffer.\n");
 		r = -ENOMEM;
 		goto pdata_err;
 	}
-- 
2.14.1

