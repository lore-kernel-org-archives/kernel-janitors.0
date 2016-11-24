From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 13:49:39 +0000
Subject: Re: [patch net-next] sfc: remove unneeded variable
Message-Id: <20161124134939.GX28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124111651.GJ17225@mwanda>
 <698affdd-d4e0-53c0-fff0-9b66252504a0@solarflare.com>
In-Reply-To: <698affdd-d4e0-53c0-fff0-9b66252504a0@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Cree <ecree@solarflare.com>
Cc: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 24, 2016 at 01:22:24PM +0000, Edward Cree wrote:
> On 24/11/16 11:16, Dan Carpenter wrote:
> > We don't use ->heap_buf after commit 46d1efd852cc ("sfc: remove Software
> > TSO") so let's remove the last traces.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/net/ethernet/sfc/net_driver.h b/drivers/net/ethernet/sfc/net_driver.h
> > index f97f828..fd17bda 100644
> > --- a/drivers/net/ethernet/sfc/net_driver.h
> > +++ b/drivers/net/ethernet/sfc/net_driver.h
> > @@ -139,8 +139,6 @@ struct efx_special_buffer {
> >   * struct efx_tx_buffer - buffer state for a TX descriptor
> >   * @skb: When @flags & %EFX_TX_BUF_SKB, the associated socket buffer to be
> >   *   freed when descriptor completes
> > - * @heap_buf: When @flags & %EFX_TX_BUF_HEAP, the associated heap buffer to be
> > - *   freed when descriptor completes.
> 
> Does that mean we can also remove EFX_TX_BUF_HEAP?

Good point.  I will resend.

regards,
dan carpenter

