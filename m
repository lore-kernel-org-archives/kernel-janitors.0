From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 13:07:15 +0000
Subject: [PATCH] Unregister device and unlock mutex before exit when error
Message-Id: <1347023235-10569-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346775269-12191-5-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346775269-12191-5-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Depends on patch 14167: http://patchwork.linuxtv.org/patch/14167/ 
[PATCH 1/5] drivers/media/platform/davinci/vpbe.c: fix error return code

 drivers/media/platform/davinci/vpbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 2e4a0da..3057030 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -648,7 +648,7 @@ static int vpbe_initialize(struct device *dev, struct vpbe_device *vpbe_dev)
 	ret = bus_for_each_dev(&platform_bus_type, NULL, vpbe_dev,
 			       platform_device_get);
 	if (ret < 0)
-		return ret;
+		goto vpbe_fail_v4l2_device;
 
 	vpbe_dev->venc = venc_sub_dev_init(&vpbe_dev->v4l2_dev,
 					   vpbe_dev->cfg->venc.module_name);
-- 
1.7.11.4

