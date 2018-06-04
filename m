From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Jun 2018 11:49:19 +0000
Subject: [PATCH] ALSA: usb-audio: remove redundant check on err
Message-Id: <20180604114919.2199-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on err is redundant as both the true and false paths
end up on a break statement. Remove the redundant check.

Detected by CoverityScan, CID#1268773 ("Identical code for different
branches")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/mixer_quirks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 4149543f613e..e82a72fea9a1 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1849,8 +1849,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	/* EMU0204 */
 	case USB_ID(0x041e, 0x3f19):
 		err = snd_emu0204_controls_create(mixer);
-		if (err < 0)
-			break;
 		break;
 
 	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
-- 
2.17.0

