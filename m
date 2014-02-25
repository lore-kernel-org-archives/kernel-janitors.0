From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Feb 2014 08:32:50 +0000
Subject: [patch 1/2] ASoC: sst-haswell-ipc: restore IRQs on error
Message-Id: <20140225083250.GA22416@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org

This should be spin_unlock_irqrestore() instead of spin_unlock()

Fixes: 22981243589c ('ASoC: Intel: Add Haswell/Broadwell IPC')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/intel/sst-haswell-ipc.c b/sound/soc/intel/sst-haswell-ipc.c
index 668d486520ae..552aebf2c8f5 100644
--- a/sound/soc/intel/sst-haswell-ipc.c
+++ b/sound/soc/intel/sst-haswell-ipc.c
@@ -527,7 +527,7 @@ static int ipc_tx_message(struct sst_hsw *hsw, u32 header, void *tx_data,
 
 	msg = msg_get_empty(hsw);
 	if (msg = NULL) {
-		spin_unlock(&hsw->dsp->spinlock);
+		spin_unlock_irqrestore(&hsw->dsp->spinlock, flags);
 		return -EBUSY;
 	}
 
