From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 09:04:42 +0000
Subject: [PATCH 1/2] ASoC: qdsp6: q6asm-dai: Off by one in of_q6asm_parse_dai_data()
Message-Id: <20181221090442.GA2735@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>

The q6asm_fe_dais[] array has MAX_SESSIONS (8) elements so the >
comparison should be >= or we access one element beyond the end of the
array.

Fixes: 22930c79ac5c ("ASoC: qdsp6: q6asm-dai: Add support to compress offload")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5b986b74dd36..9d738b4c1e05 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -874,7 +874,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
 
 	for_each_child_of_node(dev->of_node, node) {
 		ret = of_property_read_u32(node, "reg", &id);
-		if (ret || id > MAX_SESSIONS || id < 0) {
+		if (ret || id >= MAX_SESSIONS || id < 0) {
 			dev_err(dev, "valid dai id not found:%d\n", ret);
 			continue;
 		}
-- 
2.17.1
