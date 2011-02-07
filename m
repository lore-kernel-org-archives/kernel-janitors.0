From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Feb 2011 17:25:19 +0000
Subject: [patch] USB: 6fire: signedness bug in usb6fire_pcm_prepare()
Message-Id: <20110207172519.GI4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>, kernel-janitors@vger.kernel.org

rt->rate is an unsigned char so it's never equal to -1.  It's not a huge
problem because the invalid rate is caught inside the call to
usb6fire_pcm_set_rate() which returns -EINVAL.  But if we fix the test
then it prints out the correct error message so that's good.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 705c88e..ba62c74 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -493,13 +493,12 @@ static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 	sub->period_off = 0;
 
 	if (rt->stream_state = STREAM_DISABLED) {
-		rt->rate = -1;
 		for (i = 0; i < ARRAY_SIZE(rates); i++)
 			if (alsa_rt->rate = rates[i]) {
 				rt->rate = i;
 				break;
 			}
-		if (rt->rate = -1) {
+		if (i = ARRAY_SIZE(rates)) {
 			mutex_unlock(&rt->stream_mutex);
 			snd_printk("invalid rate %d in prepare.\n",
 					alsa_rt->rate);
