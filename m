From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 23 Jun 2020 07:59:57 +0000
Subject: Re: [PATCH] trivial: fix kerneldoc comments
Message-Id: <alpine.DEB.2.22.394.2006230954560.2367@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1592854669-20606-1-git-send-email-Julia.Lawall@inria.fr> <6b0649c53e853fd2a35e9996f13e702daa0d7e2f.camel@perches.com>
In-Reply-To: <6b0649c53e853fd2a35e9996f13e702daa0d7e2f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 22 Jun 2020, Joe Perches wrote:

> On Mon, 2020-06-22 at 21:37 +0200, Julia Lawall wrote:
> > Fix the parameter names in the comment to correspond to those in the
> > function header.
> >
> > Drop comments about return values when there is no return value.
>
> Done by hand or script?

Found by script but done by hand.  Unfortuntely, I can't figure even a
hackish way to get Coccinelle to modify comments.  I guess I could have
used Coccinelle to print out a patch and then run that, but since the
result has to be checked anyway, I just made the changes by hand.

>
> []
> > diff --git a/arch/mips/cavium-octeon/executive/cvmx-spi.c b/arch/mips/cavium-octeon/executive/cvmx-spi.c
> []
> > @@ -69,9 +69,7 @@ static cvmx_spi_callbacks_t cvmx_spi_callbacks = {
> >  /**
> >   * Get current SPI4 initialization callbacks
> >   *
> > - * @callbacks:	Pointer to the callbacks structure.to fill
> > - *
> > - * Returns Pointer to cvmx_spi_callbacks_t structure.
> > + * @callbacks:	Pointer to the callbacks structure, to fill.
>
> If scripted, odd comma after structure

Hmm, maybe I interpreted the words slightly differently.  t looks like it
would be fine without the comma.

>
> > diff --git a/drivers/crypto/bcm/spu.c b/drivers/crypto/bcm/spu.c
> []
> > @@ -519,7 +519,7 @@ u32 spum_assoc_resp_len(enum spu_cipher_mode cipher_mode,
> >   * spu_aead_ivlen() - Calculate the length of the AEAD IV to be included
> >   * in a SPU request after the AAD and before the payload.
> >   * @cipher_mode:  cipher mode
> > - * @iv_ctr_len:   initialization vector length in bytes
> > + * @iv_len:   initialization vector length in bytes
> >   *
> >   * In Linux ~4.2 and later, the assoc_data sg includes the IV. So no need
> >   * to include the IV as a separate field in the SPU request msg.
> > @@ -917,7 +917,7 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
> >   * setkey() time in spu_cipher_req_init().
> >   * @spu_hdr:         Start of the request message header (MH field)
> >   * @spu_req_hdr_len: Length in bytes of the SPU request header
> > - * @isInbound:       0 encrypt, 1 decrypt
> > + * @is_inbound:       0 encrypt, 1 decrypt
>
> odd alignments

Sorry to have missed these.

> etc...

Are there a lot of other such problems?  I did look through the whole
patch several times by hand, but perhaps it is just too big to see
everything.

julia
