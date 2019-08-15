From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2019 14:41:33 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Message-Id: <20190815144133.GA19557@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815083252.GD27238@mwanda>
 <5D553585.2020907@bfs.de>
In-Reply-To: <5D553585.2020907@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Thu, Aug 15, 2019 at 12:35:49PM +0200, walter harms wrote:
> 
> 
> Am 15.08.2019 10:32, schrieb Dan Carpenter:
> > The problem is that if "ret" is negative then when we check if
> > "ret > len", that condition is going to be true because of type
> > promotion.  So this patch re-orders the code to check for negatives
> > first and preserve those error codes.
> > 
> > Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 63af87609bac..986b0754495d 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2903,10 +2903,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
> >  
> >  	while (len) {
> >  		ret = spi_nor_read_data(nor, addr, len, buf);
> > -		if (!ret || ret > len)
> > -			return -EIO;
> >  		if (ret < 0)
> >  			return ret;
> > +		if (!ret || ret > len)
> > +			return -EIO;
> 
> Bonuspoints to make this more readable:
> 
> 	if (ret=0 || ret > len)
> 		return -EIO;
> 
> that makes the intention more obvious.

That's not really related to the bug fix.

I do agree with your style though.  "ret" is a number here, and not a
bool or error vs no error so = 0 is nicer.

regards,
dan carpenter
