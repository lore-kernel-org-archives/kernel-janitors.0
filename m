From: Colin King <colin.king@canonical.com>
Date: Tue, 01 May 2018 08:20:01 +0000
Subject: [PATCH][next] ASoC: amd: fix spelling mistake: "failer" -> "failure"
Message-Id: <20180501082001.21904-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/amd/acp-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 9c026c4d26d4..2b9a020e0b3e 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1014,7 +1014,7 @@ static int acp_dma_new(struct snd_soc_pcm_runtime *rtd)
 	}
 	if (ret < 0)
 		dev_err(component->dev,
-			"buffer preallocation failer error:%d\n", ret);
+			"buffer preallocation failure error:%d\n", ret);
 	return ret;
 }
 
-- 
2.17.0

