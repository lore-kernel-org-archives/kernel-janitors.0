From: Felipe Balbi <balbi@kernel.org>
Date: Tue, 28 Mar 2017 12:51:21 +0000
Subject: Re: [PATCH] usb: gadget: pch_udc: don't update td->next after it has been released to the pool
Message-Id: <878tnph8dy.fsf@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170328122850.18819-1-colin.king@canonical.com>
In-Reply-To: <20170328122850.18819-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michal Nazarewicz <mina86@mina86.com>, "Gustavo A . R . Silva" <garsilva@embeddedor.com>, Iago Abal <mail@iagoabal.eu>, Romain Perier <romain.perier@collabora.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

Colin King <colin.king@canonical.com> writes:
> From: Colin Ian King <colin.king@canonical.com>
>
> Writing to td->next should be avoided after td has been freed using
> dma_pool_free. The intent was to nullify the next pointer, but this
> is potentially dangerous once it is back in the pool. Remove it.
>
> Detected by CoverityScan, CID#1091173 ("Write tp pointer after free")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/gadget/udc/pch_udc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
> index 84dcbcd756f0..08bbe2c24134 100644
> --- a/drivers/usb/gadget/udc/pch_udc.c
> +++ b/drivers/usb/gadget/udc/pch_udc.c
> @@ -1523,7 +1523,6 @@ static void pch_udc_free_dma_chain(struct pch_udc_dev *dev,
>  		td = phys_to_virt(addr);
>  		addr2 = (dma_addr_t)td->next;
>  		dma_pool_free(dev->data_requests, td, addr);
> -		td->next = 0x00;

I already have a patch for this, thanks

1f459262b0e1649a1e5ad12fa4c66eb76c2220ce
Author:     Gustavo A. R. Silva <garsilva@embeddedor.com>
AuthorDate: Fri Mar 10 15:39:32 2017 -0600
Commit:     Felipe Balbi <felipe.balbi@linux.intel.com>
CommitDate: Wed Mar 22 11:21:10 2017 +0200

usb: gadget: udc: remove pointer dereference after free

Remove pointer dereference after free.

Addresses-Coverity-ID: 1091173
Acked-by: Michal Nazarewicz <mina86@mina86.com>
Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

1 file changed, 1 deletion(-)
drivers/usb/gadget/udc/pch_udc.c | 1 -

modified   drivers/usb/gadget/udc/pch_udc.c
@@ -1523,7 +1523,6 @@ static void pch_udc_free_dma_chain(struct pch_udc_dev *dev,
 		td = phys_to_virt(addr);
 		addr2 = (dma_addr_t)td->next;
 		pci_pool_free(dev->data_requests, td, addr);
-		td->next = 0x00;
 		addr = addr2;
 	}
 	req->chain_len = 1;

-- 
balbi
