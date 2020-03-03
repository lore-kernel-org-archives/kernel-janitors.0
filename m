From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Mar 2020 10:18:58 +0000
Subject: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
Message-Id: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Slawomir Blauciak <slawomir.blauciak@linux.intel.com>, Mark Brown <broonie@kernel.org>

We're passing "&posn" instead of "posn" so it ends up corrupting
memory instead of doing something useful.

Fixes: 53e0c72d98ba ("ASoC: SOF: Add support for IPC IO between DSP and Host")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 22d296f95761..d6bf53dcd80b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -524,7 +524,7 @@ int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
 
 	/* send IPC to the DSP */
 	err = sof_ipc_tx_message(sdev->ipc,
-				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
+				 stream.hdr.cmd, &stream, sizeof(stream), posn,
 				 sizeof(*posn));
 	if (err < 0) {
 		dev_err(sdev->dev, "error: failed to get stream %d position\n",
-- 
2.11.0
