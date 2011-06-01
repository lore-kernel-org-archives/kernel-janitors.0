From: Julia Lawall <julia@diku.dk>
Date: Wed, 01 Jun 2011 20:08:46 +0000
Subject: Re: [PATCH 4/10] drivers/net/can/flexcan.c: add missing clk_put
Message-Id: <Pine.LNX.4.64.1106012207260.5871@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1306948213-20767-4-git-send-email-julia@diku.dk>
 <1306949175.32125.20.camel@Joe-Laptop>
In-Reply-To: <1306949175.32125.20.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>, kernel-janitors@vger.kernel.org, socketcan-core@lists.berlios.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 1 Jun 2011, Joe Perches wrote:

> On Wed, 2011-06-01 at 19:10 +0200, Julia Lawall wrote:
> > The failed_get label is used after the call to clk_get has succeeded, so it
> > should be moved up above the call to clk_put.
> []
> > diff --git a/drivers/net/can/flexcan.c b/drivers/net/can/flexcan.c
> []
> > @@ -978,8 +978,8 @@ static int __devinit flexcan_probe(struct platform_device *pdev)
> >   failed_map:
> >  	release_mem_region(mem->start, mem_size);
> >   failed_req:
> > -	clk_put(clk);
> >   failed_get:
> > +	clk_put(clk);
> >   failed_clock:
> >  	return err;
> 
> If this is correct, it might be better to rename all the
> uses of failed_req to failed_get and delete label failed_req.

As I replied to Walter Harms, I believe it is correct, because I don't see 
anything in the called functions that needs to be freed.  I can redo the 
patch to eliminate the label.

julia
