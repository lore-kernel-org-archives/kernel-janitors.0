From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 12:00:56 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Fix a double unlock in pcm512x_digital_mute()
Message-Id: <20181221120056.GD2240@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221091120.GG2735@kadam>
 <f8f14c6a-46c2-995d-2df4-4ae821e1b895@gmail.com>
In-Reply-To: <f8f14c6a-46c2-995d-2df4-4ae821e1b895@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitris Papavasiliou <dpapavas@gmail.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

On Fri, Dec 21, 2018 at 01:23:37PM +0200, Dimitris Papavasiliou wrote:
> On 12/21/18 11:11 AM, Dan Carpenter wrote:
> > We accidentally call mutex_unlock(&pcm512x->mutex); twice in a row.
> 
> Ooops...  Looks like I left a spare unlock in there.  Thanks for
> catching and fixing it!

Static analysis stuff...  No big deal.

> 
> Maintainers, please let me know if there's anything I need to do
> with respect to this.

All you need to is reply with a reviewed-by tag so we can mark on the
fix that you approved it.

Reviewed-by: Your Name <email>

regards,
dan carpenter
