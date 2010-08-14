From: Dan Carpenter <error27@gmail.com>
Date: Sat, 14 Aug 2010 17:29:53 +0000
Subject: [patch v2] sound/usb/format: silence uninitialized variable
Message-Id: <20100814172953.GA645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814085846.GV645@bicker> <s5hbp95xoem.wl%tiwai@suse.de>
In-Reply-To: <s5hbp95xoem.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org

Gcc complains that ret might be used uninitialized:

sound/usb/format.c: In function ‘snd_usb_parse_audio_format’:
sound/usb/format.c:354: warning: ‘ret’ may be used uninitialized in this function
sound/usb/format.c:354: note: ‘ret’ was declared here
sound/usb/format.c:414: warning: ‘ret’ may be used uninitialized in this function
sound/usb/format.c:414: note: ‘ret’ was declared here

I suppose it could be uninitialized if there is ever a UAC_VERSION_3
released. Anyway this patch is worthwhile if only to silence the gcc
warning.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2: Totally different.  Added printk()s

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 4387f54..3a13754 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -392,6 +392,10 @@ static int parse_audio_format_i(struct snd_usb_audio *chip,
 		/* fp->channels is already set in this case */
 		ret = parse_audio_format_rates_v2(chip, fp);
 		break;
+	default:
+		snd_printk(KERN_ERR "%d:%u:%d : invalid protocol version %d\n",
+			   chip->dev->devnum, fp->iface, fp->altsetting, protocol);
+		return -EINVAL;
 	}
 
 	if (fp->channels < 1) {
@@ -452,6 +456,10 @@ static int parse_audio_format_ii(struct snd_usb_audio *chip,
 		ret = parse_audio_format_rates_v2(chip, fp);
 		break;
 	}
+	default:
+		snd_printk(KERN_ERR "%d:%u:%d : invalid protocol version %d\n",
+			   chip->dev->devnum, fp->iface, fp->altsetting, protocol);
+		return -EINVAL;
 	}
 
 	return ret;
