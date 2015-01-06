From: Kukjin Kim <kgene@kernel.org>
Date: Tue, 06 Jan 2015 01:29:51 +0000
Subject: Fwd: Re: Re: net: sxgbe: add basic framework for Samsung 10Gb ethernet driver
Message-Id: <071b01d02950$443411d0$cc9c3570$@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

This is Kukjin and Byungho asked to re-send following to you because of e-mail
client problem on his desktop, anyway see below :)

Thanks,
Kukjin

(+ Byungho's personal e-mail account)

Dan Carpenter wrote:
> Whatever happened with this?  Who is maintaining this now that Silva
> isn't around?

Hi Dan and all,

Happy New Year :-)

Yeah, Siva resigned with personal reason and as you know, unfortunately his
name is already removed from maintainer list.

> On Wed, Oct 15, 2014 at 05:15:41PM +0300, Dan Carpenter wrote:
> > Silva's email bounces.
> > 
> > On Wed, Oct 15, 2014 at 04:53:54PM +0300, Dan Carpenter wrote:
> > > Hello Siva Reddy,
> > > 
> > > The patch 1edb9ca69e8a: "net: sxgbe: add basic framework for Samsung
> > > 10Gb ethernet driver" from Mar 25, 2014, leads to the following
> > > static checker warning:
> > > 
> > > drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c:505 init_rx_ring()
> > > warning: passing freed memory 'rx_ring->rx_skbuff'
> > > 
Yeah, the checker is right and it should be fixed. I'm sorry to be in my
carelessness. To be honest I've missed the warning messages...

> > > drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
> > >    500          return 0;
> > >    501  
> > >    502  err_init_rx_buffers:
> > >    503          while (--desc_index >= 0)
> > >    504                  free_rx_ring(priv->device, rx_ring, desc_index);
> > >                                                    "^^
> > > We free "rx_ring->rx_skbuff" and "rx_ring->rx_skbuff_dma" here so the
> > > next two kfree() calls are double frees.
> > > 
Yes, correct.

> > >    505          kfree(rx_ring->rx_skbuff);
> > >    506  rxbuff_err:
> > >    507          kfree(rx_ring->rx_skbuff_dma);
> > >    508  dmamem_err:
> > >    509          dma_free_coherent(priv->device,
> > >    510                            rx_rsize * sizeof(struct sxgbe_rx_norm_desc),
> > >    511                            rx_ring->dma_rx, rx_ring->dma_rx_phy);
> > >    512  error:
> > >    513          return -ENOMEM;
> > >    514  }

Thanks for your gentle notification and let me fix it soon ;)

Byungho An

