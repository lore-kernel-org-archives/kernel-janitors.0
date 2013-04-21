From: walter harms <wharms@bfs.de>
Date: Sun, 21 Apr 2013 11:40:25 +0000
Subject: Re: [patch] ALSA: compress: info leak in snd_compr_get_caps()
Message-Id: <5173D029.10806@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130421110729.GA6171@elgon.mountain>
In-Reply-To: <20130421110729.GA6171@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Jeeja KP <jeeja.kp@intel.com>, Namarta Kohli <namartax.kohli@intel.com>



Am 21.04.2013 13:07, schrieb Dan Carpenter:
> If the ->get_caps() function doesn't clear the buffer then there would
> stack information leaked to userspace.  For example,
> soc_compr_get_caps() can return success without clearing the buffer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Perhaps the soc_compr_get_caps() function should return an error code
> if the platform->driver->compr_ops is NULL.  I'm not sure about that,
> and it's a separate issue anyway.
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index c84abc8..8d3190a 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -375,6 +375,7 @@ snd_compr_get_caps(struct snd_compr_stream *stream, unsigned long arg)
>  	if (!stream->ops->get_caps)
>  		return -ENXIO;
>  
> +	memset(&caps, 0, sizeof(caps));
>  	retval = stream->ops->get_caps(stream, &caps);
>  	if (retval)
>  		goto out;
> --

IMHO this should be done in get_caps() as it will manipulate the entries.
or is there a special reason to have it here ?

re,
 wh




