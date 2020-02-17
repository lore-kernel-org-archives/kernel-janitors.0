From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Feb 2020 09:27:52 +0000
Subject: Re: [PATCH] dma-buf: Fix a typo in Kconfig
Message-Id: <20200217092752.GF2363188@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org

On Sun, Feb 16, 2020 at 12:47:08PM +0100, Christophe JAILLET wrote:
> A 'h' ismissing in' syncronization'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 0613bb7770f5..e7d820ce0724 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -6,7 +6,7 @@ config SYNC_FILE
>  	default n
>  	select DMA_SHARED_BUFFER
>  	---help---
> -	  The Sync File Framework adds explicit syncronization via
> +	  The Sync File Framework adds explicit synchronization via
>  	  userspace. It enables send/receive 'struct dma_fence' objects to/from
>  	  userspace via Sync File fds for synchronization between drivers via
>  	  userspace components. It has been ported from Android.
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
