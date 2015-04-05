From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:13:10 +0000
Subject: Re: [PATCH 6/9] sound/pci/ctxfi/ctatc.c: fix error return code
Message-Id: <alpine.DEB.2.02.1504051413070.2038@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428233914-4503-1-git-send-email-Julia.Lawall@lip6.fr> <1428233914-4503-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428233914-4503-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Please ignore. Wrong patch set.

On Sun, 5 Apr 2015, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Initialize err before returning on failure, as done elsewhere in the
> function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> 
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  sound/pci/ctxfi/ctatc.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
> index 58b235c..a2f997a 100644
> --- a/sound/pci/ctxfi/ctatc.c
> +++ b/sound/pci/ctxfi/ctatc.c
> @@ -1725,8 +1725,10 @@ int __devinit ct_atc_create(struct snd_card *card, struct pci_dev *pci,
>  	atc_connect_resources(atc);
>  
>  	atc->timer = ct_timer_new(atc);
> -	if (!atc->timer)
> +	if (!atc->timer) {
> +		err = -ENOMEM;
>  		goto error1;
> +	}
>  
>  	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, atc, &ops);
>  	if (err < 0)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
