From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 May 2016 07:42:58 +0000
Subject: [patch] ASoC: hdac_hdmi: Potential NULL deref in hdac_hdmi_get_spk_alloc()
Message-Id: <20160503074258.GA9722@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

We intended || here instead of &&.  The original code potentially leads
to a NULL dereference.

Fixes: 2889099eb8cd ('ASoC: hdac_hdmi: Register chmap controls and ops')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3043120..7e7ff1b 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1609,7 +1609,7 @@ static int hdac_hdmi_get_spk_alloc(struct hdac_device *hdac, int pcm_idx)
 	struct hdac_hdmi_pcm *pcm = get_hdmi_pcm_from_id(hdmi, pcm_idx);
 	struct hdac_hdmi_pin *pin = pcm->pin;
 
-	if (!pin && !pin->eld.eld_valid)
+	if (!pin || !pin->eld.eld_valid)
 		return 0;
 
 	return pin->eld.info.spk_alloc;
