From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jan 2020 17:46:04 +0000
Subject: [PATCH] ALSA: usb-audio: unlock on error in probe
Message-Id: <20200115174604.rhanfgy4j3uc65cx@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Alexander Tsoy <alexander@tsoy.me>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Shuah Khan <shuah@kernel.org>

We need to unlock before we returning on this error path.

Fixes: 73ac9f5e5b43 ("ALSA: usb-audio: Add boot quirk for MOTU M Series")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2f582ac7cf78..827fb0bc8b56 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -602,7 +602,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (! chip) {
 		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
 		if (err < 0)
-			return err;
+			goto __error;
 
 		/* it's a fresh one.
 		 * now look for an empty slot and create a new card instance
-- 
2.11.0
