From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 16 Mar 2016 15:35:33 +0000
Subject: Re: [alsa-devel] [patch] ALSA: mixart: silence an uninitialized	variable warning
Message-Id: <s5hoaaebflm.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160316074213.GC12860@mwanda>
In-Reply-To: <20160316074213.GC12860@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Quentin Lambert <lambert.quentin@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 16 Mar 2016 08:42:13 +0100,
Dan Carpenter wrote:
> 
> We could print the uninitialized value of "stat" in the error message.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
> index bc81b9f..25c0ddd 100644
> --- a/sound/pci/mixart/mixart.c
> +++ b/sound/pci/mixart/mixart.c
> @@ -132,7 +132,7 @@ static int mixart_set_pipe_state(struct mixart_mgr *mgr,
>  	}
>  
>  	if(start) {
> -		u32 stat;
> +		u32 stat = 0;
>  
>  		group_state.pipe_count = 0; /* in case of start same command once again with pipe_count=0 */
>  
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
