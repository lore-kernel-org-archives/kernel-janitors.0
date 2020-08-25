From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 10:46:23 +0000
Subject: [PATCH] ASoC: hdac_hdmi: tidy up a memset()
Message-Id: <20200825104623.GA278587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>

The ARRAY_SIZE() is the number of the elements but we want to use the
number of bytes.  Fortunately, in this case the value is the same so it
doesn't affect runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/hdac_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 869d1547ae5d..c61cce53f513 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1474,7 +1474,7 @@ static int hdac_hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct hdac_hdmi_port *port;
 	struct hdac_hdmi_eld *eld;
 
-	memset(ucontrol->value.bytes.data, 0, ARRAY_SIZE(ucontrol->value.bytes.data));
+	memset(ucontrol->value.bytes.data, 0, sizeof(ucontrol->value.bytes.data));
 
 	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
 	if (!pcm) {
-- 
2.28.0
