From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jan 2013 06:43:43 +0000
Subject: [patch] ASoC: dwc: fix support for more than two channels
Message-Id: <20130125064343.GE4882@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Liam Girdwood <lgirdwood@gmail.com>, Rajeev Kumar <rajeev-dlh.kumar@st.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

There were missing break statements so everything used
TWO_CHANNEL_SUPPORT.

Also I added a return statement to silence a GCC warning:

	sound/soc/dwc/designware_i2s.c: In function ‘dw_i2s_hw_params’:
	sound/soc/dwc/designware_i2s.c:236:32: warning: ‘ch_reg’ may be
		used uninitialized in this function
		[-Wmaybe-uninitialized]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Untested.

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index 1aa5130..deb30d5 100644
--- a/sound/soc/dwc/designware_i2s.c
+++ b/sound/soc/dwc/designware_i2s.c
@@ -210,15 +210,19 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (config->chan_nr) {
 	case EIGHT_CHANNEL_SUPPORT:
 		ch_reg = 3;
+		break;
 	case SIX_CHANNEL_SUPPORT:
 		ch_reg = 2;
+		break;
 	case FOUR_CHANNEL_SUPPORT:
 		ch_reg = 1;
+		break;
 	case TWO_CHANNEL_SUPPORT:
 		ch_reg = 0;
 		break;
 	default:
 		dev_err(dev->dev, "channel not supported\n");
+		return -EINVAL;
 	}
 
 	i2s_disable_channels(dev, substream->stream);
