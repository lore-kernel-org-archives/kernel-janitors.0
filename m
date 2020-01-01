From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Jan 2020 19:17:28 +0000
Subject: Re: [PATCH 02/10] ALSA: ml403-ac97cr: use resource_size
Message-Id: <s5hmub72dh3.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 01 Jan 2020 18:49:42 +0100,
Julia Lawall wrote:
> 
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource *ptr; @@
> - ((ptr->end) - (ptr->start) + 1)
> + resource_size(ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Unfortunately this doesn't apply cleanly on my tree.  I guess you
worked on linux-next which contains a change outside the sound git
tree that converts ioremap_nocache() to ioremap().

We may apply it in sound git tree and let conflicts resolved at the
merge time.  OTOH, it's no urgent fix at all and can be postponed
after 5.6-rc1 merge, too -- then everything can be applied in a
cleaner way.

Let me know your preference.


thanks,

Takashi

> 
> ---
>  sound/drivers/ml403-ac97cr.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/drivers/ml403-ac97cr.c b/sound/drivers/ml403-ac97cr.c
> index 4e6042e652f0..9de5caaf6047 100644
> --- a/sound/drivers/ml403-ac97cr.c
> +++ b/sound/drivers/ml403-ac97cr.c
> @@ -1100,9 +1100,7 @@ snd_ml403_ac97cr_create(struct snd_card *card, struct platform_device *pfdev,
>  	PDEBUG(INIT_INFO, "Trying to reserve resources now ...\n");
>  	resource = platform_get_resource(pfdev, IORESOURCE_MEM, 0);
>  	/* get "port" */
> -	ml403_ac97cr->port = ioremap(resource->start,
> -					     (resource->end) -
> -					     (resource->start) + 1);
> +	ml403_ac97cr->port = ioremap(resource->start, resource_size(resource));
>  	if (ml403_ac97cr->port = NULL) {
>  		snd_printk(KERN_ERR SND_ML403_AC97CR_DRIVER ": "
>  			   "unable to remap memory region (%pR)\n",
> 
