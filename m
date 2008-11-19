From: Mike Rapoport <mike@compulab.co.il>
Date: Wed, 19 Nov 2008 08:51:13 +0000
Subject: [PATCH] drivers/video/backlight/da903x.c: introduce one more missing kfree
Message-Id: <1227084673-10079-1-git-send-email-mike@compulab.co.il>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811141905330.10023@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811141905330.10023@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: rpurdie@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, eric.miao@marvell.com, Mike Rapoport <mike@compulab.co.il>rpurdie@linux.intel.com

One more error handling code should have kfree as well

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/video/backlight/da903x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/backlight/da903x.c b/drivers/video/backlight/da903x.c
index 75388b9..93bb434 100644
--- a/drivers/video/backlight/da903x.c
+++ b/drivers/video/backlight/da903x.c
@@ -131,6 +131,7 @@ static int da903x_backlight_probe(struct platform_device *pdev)
 			data, &da903x_backlight_ops);
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
+		kfree(data);
 		return PTR_ERR(bl);
 	}
 
-- 
1.5.6.4

