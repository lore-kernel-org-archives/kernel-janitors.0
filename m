From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Apr 2016 11:36:06 +0000
Subject: [patch] ASoC: Intel: sst: fix a loop timeout in sst_hsw_stream_reset()
Message-Id: <20160406113606.GA23032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jie Yang <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

In the original code we ended the loop with tries set to -1 instead of
zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index ac60f13..9156522 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -1345,7 +1345,7 @@ int sst_hsw_stream_reset(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
 		return 0;
 
 	/* wait for pause to complete before we reset the stream */
-	while (stream->running && tries--)
+	while (stream->running && --tries)
 		msleep(1);
 	if (!tries) {
 		dev_err(hsw->dev, "error: reset stream %d still running\n",
