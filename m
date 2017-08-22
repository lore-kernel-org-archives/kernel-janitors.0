From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 12:28:12 +0000
Subject: Re: [PATCH] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <s5hziar9483.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
        <20170822121625.syvr64kwyh5xjexg@mwanda>
In-Reply-To: <20170822121625.syvr64kwyh5xjexg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 22 Aug 2017 14:16:25 +0200,
Dan Carpenter wrote:
> 
>   	err = snd_card_register(card);
> > -	if (err < 0) {
> > +	if (err) {
> > +free_card:
> >  		snd_card_free(card);
> >  		return err;
> >  	}
> 
> I thought we agreed, yesterday, to never use this style of error
> handling?

Yeah, this is definitely no-go.

Also, please don't omit the negative value check.


thanks,

Takashi
