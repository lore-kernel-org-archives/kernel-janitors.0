From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 21 Jun 2013 12:32:30 +0000
Subject: Re: [patch] ALSA: vx_core: off by one in vx_read_status()
Message-Id: <s5ha9mjzlsx.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130621122533.GA24059@elgon.mountain>
In-Reply-To: <20130621122533.GA24059@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Fri, 21 Jun 2013 15:25:33 +0300,
Dan Carpenter wrote:
> 
> This code is older than git, and I haven't tested it, but if size =
> SIZE_MAX_STATUS then we would write one space past the end of the
> rmh->Stat[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yes, the patch looks correct.  Applied now.
Thanks.


Takashi


> diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
> index c39961c..8359689 100644
> --- a/sound/drivers/vx/vx_core.c
> +++ b/sound/drivers/vx/vx_core.c
> @@ -205,7 +205,7 @@ static int vx_read_status(struct vx_core *chip, struct vx_rmh *rmh)
>  
>  	if (size < 1)
>  		return 0;
> -	if (snd_BUG_ON(size > SIZE_MAX_STATUS))
> +	if (snd_BUG_ON(size >= SIZE_MAX_STATUS))
>  		return -EINVAL;
>  
>  	for (i = 1; i <= size; i++) {
> 
