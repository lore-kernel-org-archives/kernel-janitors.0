From: "Eric Miao" <ymiao3@marvell.com>
Date: Wed, 19 Nov 2008 08:55:14 +0000
Subject: RE: [PATCH] drivers/video/backlight/da903x.c: introduce one more missing kfree
Message-Id: <E913911567467945BBEB9277E27868B0014E51CF@msiexch01.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811141905330.10023@pc-004.diku.dk> <1227084673-10079-1-git-send-email-mike@compulab.co.il>
In-Reply-To: <1227084673-10079-1-git-send-email-mike@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <mike@compulab.co.il>
Cc: akpm@linux-foundation.org, rpurdie@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orgrpurdie@linux.intel.com

Acked-by: Eric Miao <eric.miao@marvell.com>

Andrew,

Could you please help merge this as well? Thanks.

-----Original Message-----
From: Mike Rapoport [mailto:mike@compulab.co.il] 
Sent: Wednesday, November 19, 2008 4:51 PM
Cc: rpurdie@linux.intel.com; linux-kernel@vger.kernel.org;
kernel-janitors@vger.kernel.org; Eric Miao; Mike Rapoport;
rpurdie@linux.intel.com
Subject: [PATCH] drivers/video/backlight/da903x.c: introduce one more
missing kfree

One more error handling code should have kfree as well

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/video/backlight/da903x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/backlight/da903x.c
b/drivers/video/backlight/da903x.c
index 75388b9..93bb434 100644
--- a/drivers/video/backlight/da903x.c
+++ b/drivers/video/backlight/da903x.c
@@ -131,6 +131,7 @@ static int da903x_backlight_probe(struct
platform_device *pdev)
 			data, &da903x_backlight_ops);
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
+		kfree(data);
 		return PTR_ERR(bl);
 	}
 
-- 
1.5.6.4

