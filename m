From: Stelian Pop <stelian@popies.net>
Date: Wed, 16 Mar 2005 16:49:06 +0000
Subject: [KJ] Re: [PATCH] drivers/media/video/meye.c: Use the DMA_32BIT_MASK
Message-Id: <20050316164906.GB3411@crusoe.alcove-fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10454574992685473=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10454574992685473==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 14, 2005 at 08:54:30PM +0100, Tobias Klauser wrote:

> Hello,
> 
> Description: Use the DMA_32BIT_MASK constant from dma-mapping.h
> when calling dma_set_mask().
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
> 
> --- linux-2.6.11.orig/drivers/media/video/meye.c	2005-03-02 12:50:30.000000000 +0100
> +++ linux-2.6.11/drivers/media/video/meye.c	2005-03-10 18:20:05.000000000 +0100
> @@ -121,7 +121,7 @@ static int ptable_alloc(void)
>  	memset(meye.mchip_ptable, 0, sizeof(meye.mchip_ptable));
>  
>  	/* give only 32 bit DMA addresses */
> -	if (dma_set_mask(&meye.mchip_dev->dev, 0xffffffff))
> +	if (dma_set_mask(&meye.mchip_dev->dev, DMA_32BIT_MASK))
>  		return -1;
>  
>  	meye.mchip_ptable_toc = dma_alloc_coherent(&meye.mchip_dev->dev,

Thanks, applied to my tree. I will push it upstream later.

Stelian.
-- 
Stelian Pop <stelian@popies.net>

--===============10454574992685473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10454574992685473==--
