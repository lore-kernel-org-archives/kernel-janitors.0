From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Nov 2020 12:53:30 +0000
Subject: [PATCH] media: rockchip: rkisp1: remove some dead code
Message-Id: <X8TrSj3PbqVtN5XQ@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helen Koike <helen.koike@collabora.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Heiko Stuebner <heiko@sntech.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

The debugfs_create_dir() function never returns NULLs.  It's not supposed
to checked for errors in the normal case and there is no need to check
in this function so let's just delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 9af137e4967f..68da1eed753d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	struct rkisp1_debug *debug = &rkisp1->debug;
 
 	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
-	if (!debug->debugfs_dir) {
-		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
-		return;
-	}
 	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
 			     &debug->data_loss);
 	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
-- 
2.29.2
