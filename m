From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 08 Sep 2010 07:54:28 +0000
Subject: Re: [patch] sound/oss: potential integer overflow
Message-Id: <s5h39tkvfez.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908072632.GB32047@bicker>
In-Reply-To: <20100908072632.GB32047@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 8 Sep 2010 09:26:32 +0200,
Dan Carpenter wrote:
> 
> We don't want "pre_event_timeout" to be negative because that would
> result in a stack traces in dmesg when we schedule a negative timeout.
> In the original code "HZ * val" could overflow so I just moved the 
> check for negative below the multiply.

This would bring another side-effect.  When a value like 0x80001234
is passed, this would result in a positive value in turn.
We need additional check like below.


thanks,

Takashi

---
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index 5ac701c..b2e0789 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -191,10 +191,13 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
 			return 0;
 		if (get_user(val, p))
 			return -EFAULT;
-		if (val <= 0)
-			val = -1;
-		else
+		if (val < 0)
+			val = 0;
+		else {
 			val = (HZ * val) / 10;
+			if (val < 0) /* check overflow */
+				val = 0;
+		}
 		dp->readq->pre_event_timeout = val;
 		return put_user(val, p) ? -EFAULT : 0;
 
diff --git a/sound/oss/midibuf.c b/sound/oss/midibuf.c
index 782b3b8..b8da210 100644
--- a/sound/oss/midibuf.c
+++ b/sound/oss/midibuf.c
@@ -382,7 +382,11 @@ int MIDIbuf_ioctl(int dev, struct file *file,
 					return -EFAULT;
 				if (val < 0)
 					val = 0;
-				val = (HZ * val) / 10;
+				else {
+					val = (HZ * val) / 10;
+					if (val < 0) /* check overflow */
+						val = 0;
+				}
 				parms[dev].prech_timeout = val;
 				return put_user(val, (int __user *)arg);
 			
diff --git a/sound/oss/sequencer.c b/sound/oss/sequencer.c
index e85789e..f579210 100644
--- a/sound/oss/sequencer.c
+++ b/sound/oss/sequencer.c
@@ -1509,7 +1509,11 @@ int sequencer_ioctl(int dev, struct file *file, unsigned int cmd, void __user *a
 				return -EFAULT;
 			if (val < 0)
 				val = 0;
-			val = (HZ * val) / 10;
+			else {
+				val = (HZ * val) / 10;
+				if (val < 0) /* check overflow */
+					val = 0;
+			}
 			pre_event_timeout = val;
 			break;
 
