From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Sep 2017 09:48:43 +0000
Subject: [PATCH] ASoC: hdmi-codec: use sizeof_field rather than declaring hcp
Message-Id: <20170918094843.28121-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use FIELD_SIZEOF rather than declaring and initializing hcp. Remove
unused variables. Cleans up clang warning:

warning: Value stored to 'hcp' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/hdmi-codec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 3abf82563408..5672e516bec3 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -303,11 +303,8 @@ enum {
 static int hdmi_eld_ctl_info(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
-
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = sizeof(hcp->eld);
+	uinfo->count = FIELD_SIZEOF(struct hdmi_codec_priv, eld);
 
 	return 0;
 }
-- 
2.14.1

