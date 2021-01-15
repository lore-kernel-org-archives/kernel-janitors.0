From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 15:41:51 +0000
Subject: [PATCH][next] ALSA: usb-audio: remove initialization of param_period_time_if_needed
Message-Id: <20210115154151.75022-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable param_period_time_if_needed is being initialized with a value
that is never read, the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index f71965bf815f..ed654338f6b7 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -934,7 +934,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 {
 	const struct audioformat *fp;
 	unsigned int pt, ptmin;
-	int param_period_time_if_needed = -1;
+	int param_period_time_if_needed;
 	int err;
 
 	runtime->hw.formats = subs->formats;
-- 
2.29.2
