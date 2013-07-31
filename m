From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 08:23:24 +0000
Subject: Re: [PATCH 1/3] spi/spi-atmel: Fix format specifier warnings
Message-Id: <20130731082324.GG5002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375205737-3468-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1375205737-3468-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 31, 2013 at 10:16:59AM +0200, walter harms wrote:
> 
> 
> Am 30.07.2013 19:35, schrieb Emil Goode:
> > This patch fixes the following sparse warnings.
> > dma_addr_t can be either u32 or u64 so we should cast to the
> > largest type and use the format specifier %llx.
> > 
> > drivers/spi/spi-atmel.c: In function ‘atmel_spi_next_xfer_dma_submit’:
> > drivers/spi/spi-atmel.c:631:2: warning:
> > 	format ‘%x’ expects argument of type ‘unsigned int’,
> > 	but argument 7 has type ‘dma_addr_t’ [-Wformat]
> 
> maybe a %p is better here?
> 

No, that doesn't work for dma_addr_t.

regards,
dan carpenter

