From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Sep 2010 22:11:41 +0000
Subject: [patch v3] ALSA: rawmidi: fix the get next midi device ioctl
Message-Id: <20100908221141.GD3463@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908085308.GC32047@bicker> <20100908193641.GA3463@bicker>
	<s5hvd6grova.wl%tiwai@suse.de>
	<alpine.LNX.2.00.1009082325570.6226@eeebox2.perex-int.cz>
In-Reply-To: <alpine.LNX.2.00.1009082325570.6226@eeebox2.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Ulrich Drepper <drepper@redhat.com>

If we pass in a device which is higher than SNDRV_RAWMIDI_DEVICES then
the "next device" should be -1.  This function just returns device + 1.

But the main thing is that "device + 1" can lead to a (harmless) integer
overflow and that annoys static analysis tools.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2:  In the first version I made negative values return -EINVAL
V3:  We shouldn't return -EINVAL for numbers which are too large but
     just set the next device to -1.

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index eb68326..df67605 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -829,6 +829,8 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 		
 		if (get_user(device, (int __user *)argp))
 			return -EFAULT;
+		if (device > SNDRV_RAWMIDI_DEVICES) /* next device is -1 */
+			device = SNDRV_RAWMIDI_DEVICES;
 		mutex_lock(&register_mutex);
 		device = device < 0 ? 0 : device + 1;
 		while (device < SNDRV_RAWMIDI_DEVICES) {
