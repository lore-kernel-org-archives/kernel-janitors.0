From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 14 Dec 2009 10:16:53 +0000
Subject: Re: [PATCH 8/9] sound/isa/gus: Correct code taking the size of a pointer
Message-Id: <s5htyvtlv1m.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131242420.24267@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131242420.24267@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Sun, 13 Dec 2009 12:42:56 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(share_id) is just the size of the pointer.  On the other hand,
> block->share_id is an array, so its size seems more appropriate.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression *x;
> expression f;
> type T;
> @@
> 
> *f(...,(T)x,...)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi

> 
> ---
>  sound/isa/gus/gus_mem.c             |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
> index 661205c..af888a0 100644
> --- a/sound/isa/gus/gus_mem.c
> +++ b/sound/isa/gus/gus_mem.c
> @@ -127,7 +127,8 @@ static struct snd_gf1_mem_block *snd_gf1_mem_share(struct snd_gf1_mem * alloc,
>  	    !share_id[2] && !share_id[3])
>  		return NULL;
>  	for (block = alloc->first; block; block = block->next)
> -		if (!memcmp(share_id, block->share_id, sizeof(share_id)))
> +		if (!memcmp(share_id, block->share_id,
> +				sizeof(block->share_id)))
>  			return block;
>  	return NULL;
>  }
> 
