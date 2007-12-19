From: Andi Drebes <lists-receive@programmierforen.de>
Date: Wed, 19 Dec 2007 20:39:38 +0000
Subject: Re: [PATCH 3/3 - 2nd try] remove explicit memset to memory allocated with k[zc]alloc
Message-Id: <200712192139.39132.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <001301c84278$b4ab19c0$0b01a8c0@bureau>
In-Reply-To: <001301c84278$b4ab19c0$0b01a8c0@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

> 3) remove useless 'sizeof(u8)', which always returns 1, when computing the
> size of the memory to be allocated.
Thanks for including my proposal.

However, it seems as if your mailclient wraps lines and converts tabs into spaces.
The patch doesn't apply. Please have a look at Documentation/email-clients.txt
and check the other patches aswell. A good way to check if everything is right
is to send the patchset to yourself and then try to apply it. If it works, send it
to the mailing list.

> --- linux-2.6.24-rc5/drivers/dma/iop-adma.c 2007-12-16 11:15:52.000000000
> +0100
This line is wrapped...

> +++ linux-2.6.24-rc5/drivers/dma/iop-adma.c.cj 2007-12-19 20:44:58.000000000
> +0100
dito.

> @@ -858,10 +858,10 @@ static int __devinit iop_adma_memcpy_sel
> 
>   dev_dbg(device->common.dev, "%s\n", __FUNCTION__);
> 
> - src = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
> + src = kmalloc(IOP_ADMA_TEST_SIZE, GFP_KERNEL);
The tabs were replaced by a single tab (the same goes for the rest
of the patch).

>   if (!src)
>    return -ENOMEM;
> - dest = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
> + dest = kzalloc(IOP_ADMA_TEST_SIZE, GFP_KERNEL);
>   if (!dest) {
>    kfree(src);
>    return -ENOMEM;
> @@ -871,8 +871,6 @@ static int __devinit iop_adma_memcpy_sel
>   for (i = 0; i < IOP_ADMA_TEST_SIZE; i++)
>    ((u8 *) src)[i] = (u8)i;
> 
> - memset(dest, 0, IOP_ADMA_TEST_SIZE);
> -
>   /* Start copy, using first DMA channel */
>   dma_chan = container_of(device->common.channels.next,
>      struct dma_chan,

CCing the Maintainer would also increase the chance for an merge.

	Regards,
		Andi
