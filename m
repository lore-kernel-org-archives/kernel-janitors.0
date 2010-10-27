From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 27 Oct 2010 07:13:35 +0000
Subject: Re: [PATCH 9/14] sound/oss/sb_ess.c: delete double assignment
Message-Id: <s5h1v7c5crk.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
	<1288088743-3725-10-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-10-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Tue, 26 Oct 2010 12:25:38 +0200,
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Delete successive assignments to the same location.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression i;
> @@
> 
> *i = ...;
>  i = ...;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Thanks, applied now.


Takashi

> ---
>  sound/oss/sb_ess.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/oss/sb_ess.c b/sound/oss/sb_ess.c
> index 51a3d38..9890cf2 100644
> --- a/sound/oss/sb_ess.c
> +++ b/sound/oss/sb_ess.c
> @@ -1722,7 +1722,6 @@ printk (KERN_INFO "FKS: es_rec_set_recmask mask = %x\n", mask);
>  				right = (value & 0x0000ff00) >> 8;
>  			} else {				/* Turn it off (3)  */
>  				left  = 0;
> -				left  = 0;
>  				right = 0;
>  			}
>  			sb_common_mixer_set(devc, i + ES_REC_MIXER_RECDIFF, left, right);
> 
