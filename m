From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 Sep 2012 12:28:01 +0000
Subject: Re: [patch] ALSA: compress_core: fix open flags test in snd_compr_open()
Message-Id: <s5h8vcgrbfy.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911111243.GC22259@elgon.mountain>
In-Reply-To: <20120911111243.GC22259@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>

At Tue, 11 Sep 2012 14:12:43 +0300,
Dan Carpenter wrote:
> 
> O_RDONLY is zero so the original test (f->f_flags & O_RDONLY) is always
> false and it will never do compress capture.  The test for O_WRONLY is
> also slightly off.  The original test would consider "->flags > (O_WRONLY | O_RDWR)" as write only instead of rejecting it as invalid.
> 
> I've also removed the pr_err() because that could flood dmesg.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi

> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index ec2118d..eb60cb8 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -80,14 +80,12 @@ static int snd_compr_open(struct inode *inode, struct file *f)
>  	int maj = imajor(inode);
>  	int ret;
>  
> -	if (f->f_flags & O_WRONLY)
> +	if ((f->f_flags & O_ACCMODE) = O_WRONLY)
>  		dirn = SND_COMPRESS_PLAYBACK;
> -	else if (f->f_flags & O_RDONLY)
> +	else if ((f->f_flags & O_ACCMODE) = O_RDONLY)
>  		dirn = SND_COMPRESS_CAPTURE;
> -	else {
> -		pr_err("invalid direction\n");
> +	else
>  		return -EINVAL;
> -	}
>  
>  	if (maj = snd_major)
>  		compr = snd_lookup_minor_data(iminor(inode),
> 
