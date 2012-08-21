From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Tue, 21 Aug 2012 06:57:02 +0000
Subject: [PATCH] ASoC: compress - fix code alignment
Message-Id: <1345531502-20050-1-git-send-email-vinod.koul@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org
Cc: Vinod Koul <vinod.koul@linux.intel.com>, broonie@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, wfg@linux.intel.com, Namarta Kohli <namartax.kohli@intel.com>, lrg@ti.com

Reported-by: Fengguang Wu <wfg@linux.intel.com>
Signed-off-by: Namarta Kohli <namartax.kohli@intel.com>
Signed-off-by: Vinod Koul <vinod.koul@linux.intel.com>
---
 sound/soc/soc-compress.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 88d85ba..cc0562d 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -104,7 +104,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 
 	if (platform->driver->compr_ops && platform->driver->compr_ops->free)
 		platform->driver->compr_ops->free(cstream);
-		cpu_dai->runtime = NULL;
+	cpu_dai->runtime = NULL;
 
 	if (cstream->direction = SND_COMPRESS_PLAYBACK) {
 		if (!rtd->pmdown_time || codec->ignore_pmdown_time ||
-- 
1.7.0.4

