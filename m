From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 10:24:45 +0000
Subject: [PATCH 2/6] [media] omap_vout: Improve a size determination in two functions
Message-Id: <7edbd298-6d56-3ac7-08c1-b25527181994@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
In-Reply-To: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Muralidharan Karicheri <mkaricheri@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 10:18:26 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/omap/omap_vout.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index aebc1e628ac5..4a4d171ca573 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -1943,8 +1943,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 			struct omap2video_device, v4l2_dev);
 
 	for (k = 0; k < pdev->num_resources; k++) {
-
-		vout = kzalloc(sizeof(struct omap_vout_device), GFP_KERNEL);
+		vout = kzalloc(sizeof(*vout), GFP_KERNEL);
 		if (!vout)
 			return -ENOMEM;
 
@@ -2095,7 +2094,7 @@ static int __init omap_vout_probe(struct platform_device *pdev)
 		goto err_dss_init;
 	}
 
-	vid_dev = kzalloc(sizeof(struct omap2video_device), GFP_KERNEL);
+	vid_dev = kzalloc(sizeof(*vid_dev), GFP_KERNEL);
 	if (vid_dev = NULL) {
 		ret = -ENOMEM;
 		goto err_dss_init;
-- 
2.14.1

