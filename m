From: Julia Lawall <julia@diku.dk>
Date: Mon, 01 Sep 2008 13:23:25 +0000
Subject: Re: [PATCH] sound/arm: Bad NULL test
Message-Id: <Pine.LNX.4.64.0809011521230.9596@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809011059.54939.brunel@diku.dk> <s5hsksk12vh.wl%tiwai@suse.de>
 <Pine.LNX.4.64.0809011428010.9596@pc-004.diku.dk> <s5hod3811gf.wl%tiwai@suse.de>
In-Reply-To: <s5hod3811gf.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Julien Brunel <brunel@diku.dk>, perex@perex.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 1 Sep 2008, Takashi Iwai wrote:

> At Mon, 1 Sep 2008 14:30:29 +0200 (CEST),
> Julia Lawall wrote:
> > 
> > On Mon, 1 Sep 2008, Takashi Iwai wrote:
> > 
> > > At Mon, 1 Sep 2008 10:59:54 +0200,
> > > Julien Brunel wrote:
> > > > 
> > > > From: Julien Brunel <brunel@diku.dk>
> > > > 
> > > > In case of error, the function aaci_init_card returns an ERR pointer,
> > > > but never returns a NULL pointer. We have noticed a bad NULL test,
> > > > which comes after a call to this function. Rather than doing an IS_ERR
> > > > test, we suggest to duplicate the label out: one label for the case where
> > > > aaci_init_card returns a valid pointer, and another for the case where
> > > > aaci_init_card returns an ERR pointer.
> > > > 
> > > > The semantic match that finds this problem is as follows:
> > > > (http://www.emn.fr/x-info/coccinelle/)
> > > > 
> > > > // <smpl>
> > > > @match_bad_null_test@
> > > > expression x, E;
> > > > statement S1,S2;
> > > > @@
> > > > x =  aaci_init_card(...)
> > > > ... when != x = E
> > > > *  if (x != NULL) 
> > > > S1 else S2
> > > > // </smpl>
> > > > 
> > > > Signed-off-by:  Julien Brunel <brunel@diku.dk>
> > > > Signed-off-by:  Julia Lawall <julia@diku.dk>
> > > 
> > > The fix below is simpler.  Could you check whether it's OK?
> > 
> > It is indeed simpler, and looks correct, but it seems a little odd to take 
> > a value that can never be NULL and set it to NULL just to avoid changing a 
> > test.  Another alternative would be to leave the value as it is, and put 
> > an IS_ERR test at the out label.  But the value of the test is statically 
> > determined by the goto that reaches it, so the original patch proposes 
> > just getting rid of the test completely.
> 
> OTOH, double labels are pretty ugly and hard to follow.
> Maybe the patch like below is a bit cleaner.

OK, this seems like a reasonable compromise.  The function aaci_init_card 
is indeed only used in one place, and -ENOMEM is the only possible error 
value.  So perhaps it is just as easy to create that where it is called 
rather than in aaci_init_card itself.

julia

> Takashi
> 
> diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
> index b0a4744..89096e8 100644
> --- a/sound/arm/aaci.c
> +++ b/sound/arm/aaci.c
> @@ -999,7 +999,7 @@ static struct aaci * __devinit aaci_init_card(struct amba_device *dev)
>  	card = snd_card_new(SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
>  			    THIS_MODULE, sizeof(struct aaci));
>  	if (card = NULL)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	card->private_free = aaci_free_card;
>  
> @@ -1083,8 +1083,8 @@ static int __devinit aaci_probe(struct amba_device *dev, void *id)
>  		return ret;
>  
>  	aaci = aaci_init_card(dev);
> -	if (IS_ERR(aaci)) {
> -		ret = PTR_ERR(aaci);
> +	if (!aaci) {
> +		ret = -ENOMEM;
>  		goto out;
>  	}
>  
> 
