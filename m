From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Sep 2010 19:36:41 +0000
Subject: [patch v2] ALSA: rawmidi: fix the get next midi device ioctl
Message-Id: <20100908193641.GA3463@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908085308.GC32047@bicker>
In-Reply-To: <20100908085308.GC32047@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Ulrich Drepper <drepper@redhat.com>

If we pass in a device which is higher than SNDRV_RAWMIDI_DEVICES then
this function just returns device + 1 which isn't helpful.  I've
modified it to return -EINVAL instead.

Also Smatch complains because the "device + 1" could be an integer
overflow.  It's harmless, but we may as well silence the warning.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2:  In the first version I made negative values return -EINVAL

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index eb68326..1633bac 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -829,6 +829,8 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 		
 		if (get_user(device, (int __user *)argp))
 			return -EFAULT;
+		if (device > SNDRV_RAWMIDI_DEVICES)
+			return -EINVAL;
 		mutex_lock(&register_mutex);
 		device = device < 0 ? 0 : device + 1;
 		while (device < SNDRV_RAWMIDI_DEVICES) {
