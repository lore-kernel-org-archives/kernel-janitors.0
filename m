From: Dan Carpenter <error27@gmail.com>
Date: Sun, 10 Oct 2010 17:33:52 +0000
Subject: [patch 1/2] OSS: soundcard: locking bug in sound_ioctl()
Message-Id: <20101010173352.GB5851@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

We shouldn't return directly here because we're still holding the
&soundcard_mutex.

This bug goes all the way back to the start of git.  It's strange that
no one has complained about it as a runtime bug.

CC: stable@kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/oss/soundcard.c b/sound/oss/soundcard.c
index 938ed94..a5ab61e 100644
--- a/sound/oss/soundcard.c
+++ b/sound/oss/soundcard.c
@@ -392,11 +392,11 @@ static long sound_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
-		return audio_ioctl(dev, file, cmd, p);
+		ret = audio_ioctl(dev, file, cmd, p);
 		break;
 
 	case SND_DEV_MIDIN:
-		return MIDIbuf_ioctl(dev, file, cmd, p);
+		ret = MIDIbuf_ioctl(dev, file, cmd, p);
 		break;
 
 	}
