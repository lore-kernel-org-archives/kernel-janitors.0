From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 06 Jun 2007 03:23:13 +0000
Subject: Re: [KJ] DMA_{32,64}BIT_MASK
Message-Id: <466628A1.6030707@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706051859i6c3df99chdf635b4d962b1871@mail.gmail.com>
In-Reply-To: <ab8e556c0706051859i6c3df99chdf635b4d962b1871@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Kevin Jackson wrote:
> Hi,
>
> Based on this TODO:
> - pci_set_dma_mask() and friends should use DMA_{32,64}BIT_MASK 
> instead of...
>
> I started playing with grep to see if I could find any code which
> wasn't using this DMA_32|64BIT_MASK.
>
> In drivers/scsi/3w-xxxx.c, instead of using DMA_32BIT_MASK the
> pci_set_dma_mask uses TW_DMA_MASK which is declared in
> drivers/scsi/3-xxxx.h :
>
> #define TW_DMA_MASK                           DMA_32BIT_MASK
>
> This looks to my untrained eye like an API was changed and to get
> compatibility, the TW_DMA_MASK was simply defined to be the same as
> DMA_32BIT_MASK.
>
> Again this is my second day (about 4 hours in) at looking at kernel
> code, but my naive assumption is that nothing would be lost by
> removing the TW_DMA_MASK definition completely from both the .c and .h
> files and using the DMA_32BIT_MASK directly.
>
> Can anyone tell me that I'm either correct or talking total crap? :)
> If I'm right about this the next step would of course be to supply a
> (very minor) patch with the changes... scary stuff ;)
As it does not add any information by the name (and only used once), I 
would say you are right on the spot. :)
Please send in your patch. (BTW, check out 
Documentation/SubmittingPatches if you have not done it yet).

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
