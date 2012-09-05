From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 05 Sep 2012 13:40:06 +0000
Subject: Re: [patch] ALSA: compress_core: integer overflow in snd_compr_allocate_buffer()
Message-Id: <s5hwr08ziyx.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123217.GD6128@elgon.mountain>
In-Reply-To: <20120905123217.GD6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>

At Wed, 5 Sep 2012 15:32:18 +0300,
Dan Carpenter wrote:
> 
> These are 32 bit values that come from the user, we need to check for
> integer overflows or we could end up allocating a smaller buffer than
> expected.

The buffer size here is supposed to be fairly small that kmalloc can
handle.  So, the overflow check is good, but in practice it'd return
-ENOMEM.  Of course, it's fine to put the sanity check, but such
checks could be better peformed in snd_compr_set_params() before
calling the allocation, I think.


thanks,

Takashi

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index ec2118d..5a733e7 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -409,6 +409,10 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
>  	unsigned int buffer_size;
>  	void *buffer;
>  
> +	if (params->buffer.fragment_size = 0 ||
> +	    params->buffer.fragments > SIZE_MAX / params->buffer.fragment_size)
> +		return -EINVAL;
> +
>  	buffer_size = params->buffer.fragment_size * params->buffer.fragments;
>  	if (stream->ops->copy) {
>  		buffer = NULL;
> 
