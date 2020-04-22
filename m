From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Apr 2020 11:24:17 +0000
Subject: [PATCH] ASoC: SOF: ensure all fields in header are zero'd before copying back to userspace
Message-Id: <20200422112417.208843-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Field header.tlv is uninitialized and being copied back to userspace
and hence leaking data from the stack to userspace.  Fix this by
ensuring the header structure is zero'd.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Addresses-Coverity: ("Uninitialized scalar variable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sof/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index dfc412e2d956..97d5c1a4c1ff 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -362,7 +362,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
-	struct snd_ctl_tlv header;
+	struct snd_ctl_tlv header = { };
 	struct snd_ctl_tlv __user *tlvd  		(struct snd_ctl_tlv __user *)binary_data;
 	int data_size;
-- 
2.25.1
