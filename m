From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 17 May 2010 06:16:41 +0000
Subject: Re: [patch -next] asihpi: testing the wrong variable
Message-Id: <s5hwrv3t5me.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100514144920.GC17487@bicker>
In-Reply-To: <20100514144920.GC17487@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Fri, 14 May 2010 16:49:20 +0200,
Dan Carpenter wrote:
> 
> There is a typo here.  We want to test "*dst" not "dst".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks.  Applied (your other fix for asihpi, too).


Takashi

> diff --git a/sound/pci/asihpi/hpifunc.c b/sound/pci/asihpi/hpifunc.c
> index 254c580..15f0c7e 100644
> --- a/sound/pci/asihpi/hpifunc.c
> +++ b/sound/pci/asihpi/hpifunc.c
> @@ -3279,7 +3279,7 @@ static u16 hpi_entity_alloc_and_copy(struct hpi_entity *src,
>  
>  	buf_size = hpi_entity_size(src);
>  	*dst = kmalloc(buf_size, GFP_KERNEL);
> -	if (dst = NULL)
> +	if (*dst = NULL)
>  		return HPI_ERROR_MEMORY_ALLOC;
>  	memcpy(*dst, src, buf_size);
>  	return 0;
> 
