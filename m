From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Mar 2017 15:21:41 +0000
Subject: [PATCH 1/2] ALSA: timer: remove some dead code
Message-Id: <20170331152141.GB8141@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Takashi Iwai <tiwai@suse.com>, Kangjie Lu <kangjielu@gmail.com>

We just checked "id.card < 0" on the lines before so we know it's not
true here.  We can delete that check.

Also checkpatch.pl complains about some extra curly braces so we may as
well fix that while we're at it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6d4fbc439246..8b9e7943a83b 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1430,18 +1430,13 @@ static int snd_timer_user_next_device(struct snd_timer_id __user *_tid)
 			if (id.card < 0) {
 				id.card = 0;
 			} else {
-				if (id.card < 0) {
-					id.card = 0;
+				if (id.device < 0) {
+					id.device = 0;
 				} else {
-					if (id.device < 0) {
-						id.device = 0;
-					} else {
-						if (id.subdevice < 0) {
-							id.subdevice = 0;
-						} else {
-							id.subdevice++;
-						}
-					}
+					if (id.subdevice < 0)
+						id.subdevice = 0;
+					else
+						id.subdevice++;
 				}
 			}
 			list_for_each(p, &snd_timer_list) {
