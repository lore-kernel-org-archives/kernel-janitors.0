From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 06 Mar 2015 12:06:21 +0000
Subject: Re: [patch v3] ALSA: opl3: small array underflow
Message-Id: <s5hwq2u49fm.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305174906.GB17072@mwanda>
In-Reply-To: <20150305174906.GB17072@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org

At Thu, 5 Mar 2015 20:49:06 +0300,
Dan Carpenter wrote:
> 
> There is a missing lower bound check on "pitchbend" so it means we can
> read up to 6 elements before the start of the opl3_note_table[] array.
> 
> Thanks to Clemens Ladisch for his help with this patch.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v3:  The first two versions of this broke the user space API.

Applied, thanks.


Takashi

> 
> diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
> index f62780e..7821b07 100644
> --- a/sound/drivers/opl3/opl3_midi.c
> +++ b/sound/drivers/opl3/opl3_midi.c
> @@ -105,6 +105,8 @@ static void snd_opl3_calc_pitch(unsigned char *fnum, unsigned char *blocknum,
>  		int pitchbend = chan->midi_pitchbend;
>  		int segment;
>  
> +		if (pitchbend < -0x2000)
> +			pitchbend = -0x2000;
>  		if (pitchbend > 0x1FFF)
>  			pitchbend = 0x1FFF;
>  
> 
