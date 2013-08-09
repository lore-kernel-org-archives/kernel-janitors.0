From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 09 Aug 2013 10:38:58 +0000
Subject: Re: [alsa-devel] [patch] sound: oss/dmabuf: remove an unneeded	temporary variable
Message-Id: <s5hiozf2lod.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809095705.GE29282@elgon.mountain>
In-Reply-To: <20130809095705.GE29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

At Fri, 9 Aug 2013 12:57:06 +0300,
Dan Carpenter wrote:
> 
> We don't actually use the "go" variable so it can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/oss/dmabuf.c b/sound/oss/dmabuf.c
> index a59c888..461d94c 100644
> --- a/sound/oss/dmabuf.c
> +++ b/sound/oss/dmabuf.c
> @@ -557,7 +557,6 @@ int DMAbuf_getrdbuffer(int dev, char **buf, int *len, int dontblock)
>  	unsigned long flags;
>  	int err = 0, n = 0;
>  	struct dma_buffparms *dmap = adev->dmap_in;
> -	int go;
>  
>  	if (!(adev->open_mode & OPEN_READ))
>  		return -EIO;
> @@ -584,7 +583,7 @@ int DMAbuf_getrdbuffer(int dev, char **buf, int *len, int dontblock)
>  			spin_unlock_irqrestore(&dmap->lock,flags);
>  			return -EAGAIN;
>  		}
> -		if ((go = adev->go))
> +		if (adev->go)
>  			timeout = dmabuf_timeout(dmap);
>  
>  		spin_unlock_irqrestore(&dmap->lock,flags);
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
