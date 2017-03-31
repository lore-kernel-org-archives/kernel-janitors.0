From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Mar 2017 13:53:40 +0000
Subject: [PATCH] ALSA: emux: stop if copy_from_user() fails
Message-Id: <20170331135340.GA22338@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

If we can't fill the "patch" struct because "count" is too small (it can
be as low as 4 bytes) or because copy_from_user() failed, then just
return instead of using unintialized data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index ac75816ada7c..850fab4a8f3b 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -225,9 +225,9 @@ snd_emux_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
 	else if (format = SNDRV_OSS_SOUNDFONT_PATCH) {
 		struct soundfont_patch_info patch;
 		if (count < (int)sizeof(patch))
-			rc = -EINVAL;
+			return -EINVAL;
 		if (copy_from_user(&patch, buf, sizeof(patch)))
-			rc = -EFAULT;
+			return -EFAULT;
 		if (patch.type >= SNDRV_SFNT_LOAD_INFO &&
 		    patch.type <= SNDRV_SFNT_PROBE_DATA)
 			rc = snd_soundfont_load(emu->sflist, buf, count, SF_CLIENT_NO(p->chset.port));
