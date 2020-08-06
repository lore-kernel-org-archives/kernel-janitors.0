From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 10:51:34 +0000
Subject: [PATCH] ALSA: usb: fix spelling mistake "buss" -> "bus"
Message-Id: <20200806105134.46447-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a usb_audio_dbg debug message. Also
replace "param" with "parameter".  Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/mixer_us16x08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 986145fd2ce0..a4d4d71db55b 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -329,7 +329,7 @@ static int snd_us16x08_bus_put(struct snd_kcontrol *kcontrol,
 		elem->cached |= 1;
 		elem->cache_val[0] = val;
 	} else {
-		usb_audio_dbg(chip, "Failed to set buss param, err:%d\n", err);
+		usb_audio_dbg(chip, "Failed to set bus parameter, err:%d\n", err);
 	}
 
 	return err > 0 ? 1 : 0;
-- 
2.27.0
