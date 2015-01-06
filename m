From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Jan 2015 08:15:24 +0000
Subject: Re: Fwd: Re: Re: net: sxgbe: add basic framework for Samsung 10Gb ethernet driver
Message-Id: <20150106081524.GC14982@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <071b01d02950$443411d0$cc9c3570$@kernel.org>
In-Reply-To: <071b01d02950$443411d0$cc9c3570$@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > > On Wed, Oct 15, 2014 at 04:53:54PM +0300, Dan Carpenter wrote:
> > > > Hello Siva Reddy,
> > > > 
> > > > The patch 1edb9ca69e8a: "net: sxgbe: add basic framework for Samsung
> > > > 10Gb ethernet driver" from Mar 25, 2014, leads to the following
> > > > static checker warning:
> > > > 
> > > > drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c:505 init_rx_ring()
> > > > warning: passing freed memory 'rx_ring->rx_skbuff'
> > > > 
> Yeah, the checker is right and it should be fixed. I'm sorry to be in my
> carelessness. To be honest I've missed the warning messages...
> 

No no.  No problems.  This is a Smatch warning and you need the cross
function database configured.  I wasn't expecting that you would see the
warnings.

regards,
dan carpenter

