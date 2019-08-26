From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 13:45:50 +0000
Subject: [PATCH] ALSA: usb-audio: remove some dead code
Message-Id: <20190826134550.GA8842@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Richard Fontana <rfontana@redhat.com>, alsa-devel@alsa-project.org, Hui Peng <benquike@gmail.com>, kernel-janitors@vger.kernel.org, Wenwen Wang <wang6495@umn.edu>

We recently cleaned up the error handling in commit 52c3e317a857 ("ALSA:
usb-audio: Unify the release of usb_mixer_elem_info objects") but
accidentally left this stray return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/mixer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a0468c4a6326..a607577f0097 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2633,7 +2633,6 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
 		err = -ENOMEM;
 		goto error_name;
-		return -ENOMEM;
 	}
 	kctl->private_value = (unsigned long)namelist;
 	kctl->private_free = usb_mixer_selector_elem_free;
-- 
2.20.1
