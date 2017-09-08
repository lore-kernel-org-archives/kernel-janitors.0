From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 19:42:17 +0000
Subject: [PATCH 1/3] [media] fsl-viu: Delete an error message for a failed memory allocation in viu_of_probe(
Message-Id: <c5314800-1b8b-b9cd-17e5-a1ffe633bb53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bf912679-c695-c9c0-a464-3bd3e976fa8a@users.sourceforge.net>
In-Reply-To: <bf912679-c695-c9c0-a464-3bd3e976fa8a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Geliang Tang <geliangtang@gmail.com>, Hans Verkuil <hansverk@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 21:03:22 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/fsl-viu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index fb43025df573..526f80649864 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -1433,5 +1433,4 @@ static int viu_of_probe(struct platform_device *op)
 	if (!viu_dev) {
-		dev_err(&op->dev, "Can't allocate private structure\n");
 		ret = -ENOMEM;
 		goto err;
 	}
-- 
2.14.1

