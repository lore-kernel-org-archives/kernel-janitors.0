From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2020 10:18:53 +0000
Subject: [PATCH] ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
Message-Id: <20201103101853.GD1127762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

This code is correct, but it should be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/lpass-sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index c6292f9e613f..61a208fe6875 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -96,8 +96,8 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
 						v->rdma_channels);
 
-		if (chan >= v->rdma_channels)
-			return -EBUSY;
+			if (chan >= v->rdma_channels)
+				return -EBUSY;
 		} else {
 			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
 					v->wrdma_channel_start +
-- 
2.28.0
