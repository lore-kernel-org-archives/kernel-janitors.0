From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 21 Dec 2006 00:05:56 +0000
Subject: Re: [KJ] [PATCH] Replace __get_free_pages(...GFP_DMA...) with
Message-Id: <Pine.LNX.4.64.0612201903400.11596@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


regarding arch/s390/kernel/smp.c:

On Thu, 21 Dec 2006, Arnd Bergmann wrote:

> Maybe add a comment like
>
> /*
>  * Not actually used for DMA, but needs to be below 2GB as defined
>  * by the CPU architecture.
>  */
>
> The comment should have been there already, but since you're
> touching the code, it would be good to add it now.

final question, then -- i can add that comment, but should that
snippet of code even be changed?  if it's not *actually* used for DMA,
then it makes little sense to transform the call to
__get_dma_pages().  that would probably make it even *more*
misleading.

i will defer to others' judgment on this one.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
