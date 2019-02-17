From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:48:30 +0000
Subject: [PATCH] ASoC: fsi: fix spelling mistake "doens't" -> "doesn't"
Message-Id: <20190217224830.17355-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sh/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 285afbafa662..3447dbdba1f1 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -780,7 +780,7 @@ static int fsi_clk_init(struct device *dev,
 			return -EINVAL;
 		}
 		if (clock->div = clock->own) {
-			dev_err(dev, "cpu doens't support div clock\n");
+			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
 		}
 	}
-- 
2.20.1
