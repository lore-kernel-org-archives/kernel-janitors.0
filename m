From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:26:05 +0000
Subject: [PATCH] [media] wl128x: fix spelling mistake: "Swtich" -> "Switch"
Message-Id: <20190217222605.16182-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a fmdbg debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/radio/wl128x/fmdrv_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index 800d69c3f80b..e1c218b23d9e 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -908,7 +908,7 @@ static void fm_irq_afjump_setfreq(struct fmdev *fmdev)
 	u16 frq_index;
 	u16 payload;
 
-	fmdbg("Swtich to %d KHz\n", fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx]);
+	fmdbg("Switch to %d KHz\n", fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx]);
 	frq_index = (fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx] -
 	     fmdev->rx.region.bot_freq) / FM_FREQ_MUL;
 
-- 
2.20.1
