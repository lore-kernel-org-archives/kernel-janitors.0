From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:24:41 +0000
Subject: [patch] ASoC: wm8994: missing break in wm8994_aif3_hw_params()
Message-Id: <20130430072441.GB7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>

The missing break here means that we always return early and the
function is a no-op.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 14094f5..1eb152c 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2882,6 +2882,7 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
 		default:
 			return 0;
 		}
+		break;
 	default:
 		return 0;
 	}
