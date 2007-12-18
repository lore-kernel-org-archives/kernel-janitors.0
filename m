From: Andi Drebes <lists-receive@programmierforen.de>
Date: Tue, 18 Dec 2007 22:53:58 +0000
Subject: Re: [PATCH 3/3] remove explicit memset to memory allocated with k[zc]alloc
Message-Id: <200712182353.59042.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <005801c841bb$6723d330$0b01a8c0@bureau>
In-Reply-To: <005801c841bb$6723d330$0b01a8c0@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

> 1) Remove an explicit memset(.., 0, ...) to a varialable allocated with
> kzalloc.
> 
> 2) Allocate 'src' with kmalloc instead of kzalloc as all elements of the
> 'src' buffer are initialized in a 'for(...)' loop
The changes look good to me, but there's another thing that could be done in that file:
There's no need for the expression "sizeof(u8)" since it always returns 1. Could you
fix that too and submit a new patch?

There are quite a lot of statements like that in the kernel...

$ grep -r "sizeof(u8)" . | wc -l
53

> --- linux-2.6.24-rc5/drivers/dma/iop-adma.c 2007-12-16 11:15:52.000000000
> +0100
> +++ linux-2.6.24-rc5/drivers/dma/iop-adma.c.cj 2007-12-17 22:05:36.000000000
> +0100
> @@ -858,7 +858,7 @@ static int __devinit iop_adma_memcpy_sel
> 
>   dev_dbg(device->common.dev, "%s\n", __FUNCTION__);
> 
> - src = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
> + src = kmalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
>   if (!src)
>    return -ENOMEM;
>   dest = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
> @@ -871,8 +871,6 @@ static int __devinit iop_adma_memcpy_sel
>   for (i = 0; i < IOP_ADMA_TEST_SIZE; i++)
>    ((u8 *) src)[i] = (u8)i;
> 
> - memset(dest, 0, IOP_ADMA_TEST_SIZE);
> -
>   /* Start copy, using first DMA channel */
>   dma_chan = container_of(device->common.channels.next,
>      struct dma_chan,

Regards,
	Andi
