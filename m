From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 26 May 2005 16:35:55 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <200505262035.56268.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526122502.7aa13915.rnsanchez@terra.com.br>
In-Reply-To: <20050526122502.7aa13915.rnsanchez@terra.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 26 May 2005 19:25, Ricardo Nabinger Sanchez wrote:
> o Fixes strings declaration from char *str = ""; to char str[] = "";,
>   avoiding the extra pointer, as noted by Jeff Garzik.

>  arch/cris/arch-v10/drivers/axisflashmap.c |    2 +-

What's the difference in .text and .data sizes?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
