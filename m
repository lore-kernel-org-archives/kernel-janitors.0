From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2018 09:03:19 +0000
Subject: [PATCH] ALSA: usb-audio: silence a static checker warning
Message-Id: <20180329090319.GB17927@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

We recently made "format" a u64 variable so now static checkers complain
that this shift will wrap around if format is more than 31.  I don't
think it makes a difference for runtime, but it's simple to silence the
warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/usb/format.c b/sound/usb/format.c
index edbe67eeddfa..49e7ec6d2399 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -55,7 +55,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 		struct uac_format_type_i_discrete_descriptor *fmt = _fmt;
 		sample_width = fmt->bBitResolution;
 		sample_bytes = fmt->bSubframeSize;
-		format = 1 << format;
+		format = 1ULL << format;
 		break;
 	}
 
