From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:12:37 +0000
Subject: Re: [PATCH 9/9] sound/ppc/snd_ps3.c: fix error return code
Message-Id: <alpine.DEB.2.02.1504051412330.2038@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428233914-4503-1-git-send-email-Julia.Lawall@lip6.fr> <1428233914-4503-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428233914-4503-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Geoff Levand <geoff@infradead.org>, kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Please ignore. Wrong patch set.

On Sun, 5 Apr 2015, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Initialize ret before returning on failure, as done elsewhere in the
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
>  sound/ppc/snd_ps3.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
> index 1aa52ef..9b18b52 100644
> --- a/sound/ppc/snd_ps3.c
> +++ b/sound/ppc/snd_ps3.c
> @@ -1040,6 +1040,7 @@ static int __devinit snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
>  				   GFP_KERNEL);
>  	if (!the_card.null_buffer_start_vaddr) {
>  		pr_info("%s: nullbuffer alloc failed\n", __func__);
> +		ret = -ENOMEM;
>  		goto clean_preallocate;
>  	}
>  	pr_debug("%s: null vaddr=%p dma=%#llx\n", __func__,
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
