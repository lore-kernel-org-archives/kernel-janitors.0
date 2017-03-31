From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Mar 2017 15:22:23 +0000
Subject: [PATCH 2/2] ALSA: timer: Info leak in snd_timer_user_tinterrupt()
Message-Id: <20170331152223.GC8141@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Kangjie Lu <kangjielu@gmail.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Takashi Iwai <tiwai@suse.com>

The "r1" struct has memory holes.  We clear it with memset on one path
where it is used but not the other.  Let's just memset it at the start
of the function so it's always safe.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 8b9e7943a83b..2f836ca09860 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1277,6 +1277,7 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 	struct timespec tstamp;
 	int prev, append = 0;
 
+	memset(&r1, 0, sizeof(r1));
 	memset(&tstamp, 0, sizeof(tstamp));
 	spin_lock(&tu->qlock);
 	if ((tu->filter & ((1 << SNDRV_TIMER_EVENT_RESOLUTION) |
@@ -1292,7 +1293,6 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 	}
 	if ((tu->filter & (1 << SNDRV_TIMER_EVENT_RESOLUTION)) &&
 	    tu->last_resolution != resolution) {
-		memset(&r1, 0, sizeof(r1));
 		r1.event = SNDRV_TIMER_EVENT_RESOLUTION;
 		r1.tstamp = tstamp;
 		r1.val = resolution;
