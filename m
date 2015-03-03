From: Clemens Ladisch <clemens@ladisch.de>
Date: Tue, 03 Mar 2015 11:21:34 +0000
Subject: Re: [alsa-devel] [patch] ALSA: seq_midi_emul: small array underflow
Message-Id: <54F5993E.7000109@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150303093829.GA7685@mwanda>
In-Reply-To: <20150303093829.GA7685@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> In snd_opl3_calc_pitch() then the limit is:
>
> 	if (pitchbend > 0x1FFF)
> 		pitchbend = 0x1FFF;
>
> But it can underflow meaning that segment can be as low as
> SHORT_MIN / 0x1000 and we can read 6 elements before the start of the
> opl3_note_table[] array.

> -	short midi_pitchbend;		/* Pitch bend amount */
> +	unsigned short midi_pitchbend;	/* Pitch bend amount */

Pitch bend is a signed 14-bit value.  What is wrong is the missing
check for the lower bound.


Regards,
Clemens
