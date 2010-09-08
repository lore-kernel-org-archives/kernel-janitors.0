From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Sep 2010 07:26:32 +0000
Subject: [patch] sound/oss: potential integer overflow
Message-Id: <20100908072632.GB32047@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

We don't want "pre_event_timeout" to be negative because that would
result in a stack traces in dmesg when we schedule a negative timeout.
In the original code "HZ * val" could overflow so I just moved the 
check for negative below the multiply.

Also the code in snd_seq_oss_ioctl() deliberately set the timeout to -1
which is wrong.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/oss/sequencer.c b/sound/oss/sequencer.c
index e85789e..de61295 100644
--- a/sound/oss/sequencer.c
+++ b/sound/oss/sequencer.c
@@ -1507,9 +1507,9 @@ int sequencer_ioctl(int dev, struct file *file, unsigned int cmd, void __user *a
 		case SNDCTL_MIDI_PRETIME:
 			if (get_user(val, p))
 				return -EFAULT;
+			val = (HZ * val) / 10;
 			if (val < 0)
 				val = 0;
-			val = (HZ * val) / 10;
 			pre_event_timeout = val;
 			break;
 
diff --git a/sound/oss/midibuf.c b/sound/oss/midibuf.c
index 782b3b8..73acacd 100644
--- a/sound/oss/midibuf.c
+++ b/sound/oss/midibuf.c
@@ -380,9 +380,9 @@ int MIDIbuf_ioctl(int dev, struct file *file,
 			case SNDCTL_MIDI_PRETIME:
 				if (get_user(val, (int __user *)arg))
 					return -EFAULT;
+				val = (HZ * val) / 10;
 				if (val < 0)
 					val = 0;
-				val = (HZ * val) / 10;
 				parms[dev].prech_timeout = val;
 				return put_user(val, (int __user *)arg);
 			
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index 5ac701c..ae2a39f 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -191,10 +191,9 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
 			return 0;
 		if (get_user(val, p))
 			return -EFAULT;
-		if (val <= 0)
-			val = -1;
-		else
-			val = (HZ * val) / 10;
+		val = (HZ * val) / 10;
+		if (val < 0)
+			val = 0;
 		dp->readq->pre_event_timeout = val;
 		return put_user(val, p) ? -EFAULT : 0;
 
