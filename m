From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:08:04 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 1/17] fix sparse warnings (__nocast type)
Message-Id: <200507040208.05150.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031841.19575.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031841.19575.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:41, Victor Fusco wrote:
> --- linux-2.6-git.orig/include/linux/gfp.h
> +++ linux-2.6-git/include/linux/gfp.h
> 
> -#define __GFP_DMA	0x01
> -#define __GFP_HIGHMEM	0x02
> +#define __GFP_DMA	0x01u
> +#define __GFP_HIGHMEM	0x02u

Already in -mm.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
