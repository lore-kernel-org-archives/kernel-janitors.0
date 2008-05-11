From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 11 May 2008 15:48:54 +0000
Subject: Re: [PATCH 1/4] sound/isa: use unsigned for loop index
Message-Id: <20080511164335.GA19745@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805111450000.29620@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805111450000.29620@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: perex@perex.cz, ricardo@scarybox.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, May 11, 2008 at 02:50:33PM +0200, Julia Lawall wrote:
> A few more cases in the spirit of the patch "Trivial: Replacement of always
> >0 ints with unsigned ints" submitted by Ricardo Martins <ricardo@scarybox.net>

And rationale for those would be ...?

> --- a/sound/isa/es1688/es1688_lib.c
> +++ b/sound/isa/es1688/es1688_lib.c
> @@ -101,7 +101,7 @@ static unsigned char snd_es1688_mixer_re
>  
>  static int snd_es1688_reset(struct snd_es1688 *chip)
>  {
> -	int i;
> +	unsigned int i;
>  
>  	outb(3, ES1688P(chip, RESET));		/* valid only for ESS chips, SB -> 1 */
>  	udelay(10);

