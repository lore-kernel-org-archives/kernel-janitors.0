From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Aug 2012 15:55:15 +0000
Subject: [patch] oss/sb_audio: prevent divide by zero bug
Message-Id: <20120818155515.GA22424@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Speed comes from get_user() in audio_ioctl().  We use it to set the "s"
variable before clamping it to valid values so it could lead to a divide
by zero bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/oss/sb_audio.c b/sound/oss/sb_audio.c
index 733b014..b2b3c01 100644
--- a/sound/oss/sb_audio.c
+++ b/sound/oss/sb_audio.c
@@ -575,13 +575,15 @@ static int jazz16_audio_set_speed(int dev, int speed)
 	if (speed > 0)
 	{
 		int tmp;
-		int s = speed * devc->channels;
+		int s;
 
 		if (speed < 5000)
 			speed = 5000;
 		if (speed > 44100)
 			speed = 44100;
 
+		s = speed * devc->channels;
+
 		devc->tconst = (256 - ((1000000 + s / 2) / s)) & 0xff;
 
 		tmp = 256 - devc->tconst;
