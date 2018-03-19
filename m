From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 11:18:09 +0000
Subject: [PATCH] staging: media: davinci_vpfe: fix spelling of resizer_configure_in_continious_mode
Message-Id: <20180319111809.1275-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix: rename function resizer_configure_in_continious_mode to
resizer_configure_in_continuous_mode to fix spelling mistake.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/davinci_vpfe/dm365_resizer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.c b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
index 857b0e847c5e..1ee216d71d42 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_resizer.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
@@ -480,7 +480,7 @@ resizer_configure_common_in_params(struct vpfe_resizer_device *resizer)
 	return 0;
 }
 static int
-resizer_configure_in_continious_mode(struct vpfe_resizer_device *resizer)
+resizer_configure_in_continuous_mode(struct vpfe_resizer_device *resizer)
 {
 	struct device *dev = resizer->crop_resizer.subdev.v4l2_dev->dev;
 	struct resizer_params *param = &resizer->config;
@@ -1242,7 +1242,7 @@ static int resizer_do_hw_setup(struct vpfe_resizer_device *resizer)
 		    ipipeif_source = IPIPEIF_OUTPUT_RESIZER)
 			ret = resizer_configure_in_single_shot_mode(resizer);
 		else
-			ret =  resizer_configure_in_continious_mode(resizer);
+			ret =  resizer_configure_in_continuous_mode(resizer);
 		if (ret)
 			return ret;
 		ret = config_rsz_hw(resizer, param);
-- 
2.15.1

