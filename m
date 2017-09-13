From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Sep 2017 23:01:16 +0000
Subject: [PATCH] ALSA: hwdep: prevent a harmless shift wrapping bug
Message-Id: <20170913230116.yspku7ov2hgqtigh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

The "info.index" variable represents a bit in hw->dsp_loaded which is
an unsigned int.  If it's higher than 31 we hit a shift wrapping bug.
This seems harmless, but I wanted to silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index a73baa1242be..8faae3d1455d 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -228,6 +228,8 @@ static int snd_hwdep_dsp_load(struct snd_hwdep *hw,
 	memset(&info, 0, sizeof(info));
 	if (copy_from_user(&info, _info, sizeof(info)))
 		return -EFAULT;
+	if (info.index >= 32)
+		return -EINVAL;
 	/* check whether the dsp was already loaded */
 	if (hw->dsp_loaded & (1 << info.index))
 		return -EBUSY;
