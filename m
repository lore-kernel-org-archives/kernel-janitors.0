From: Dan Carpenter <error27@gmail.com>
Date: Sun, 10 Oct 2010 17:34:22 +0000
Subject: [patch 2/2] OSS: soundcard: fix return value of sound_open()
Message-Id: <20101010173422.GC5851@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/oss/soundcard.c b/sound/oss/soundcard.c
index a5ab61e..46c0d03 100644
--- a/sound/oss/soundcard.c
+++ b/sound/oss/soundcard.c
@@ -249,7 +249,7 @@ static int sound_open(struct inode *inode, struct file *file)
 	}
 
 	mutex_unlock(&soundcard_mutex);
-	return 0;
+	return retval;
 }
 
 static int sound_release(struct inode *inode, struct file *file)
