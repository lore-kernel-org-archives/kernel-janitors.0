From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 23 Jun 2020 09:45:48 +0000
Subject: Re: [PATCH] trivial: fix kerneldoc comments
Message-Id: <alpine.DEB.2.22.394.2006231145350.2367@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1592854669-20606-1-git-send-email-Julia.Lawall@inria.fr> <6b0649c53e853fd2a35e9996f13e702daa0d7e2f.camel@perches.com> <alpine.DEB.2.22.394.2006230954560.2367@hadrien> <20200623093228.GI4151@kadam>
In-Reply-To: <20200623093228.GI4151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joe Perches <joe@perches.com>, trivial@kernel.org, kernel-janitors@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org



On Tue, 23 Jun 2020, Dan Carpenter wrote:

> On Tue, Jun 23, 2020 at 09:59:57AM +0200, Julia Lawall wrote:
> > > > diff --git a/drivers/crypto/bcm/spu.c b/drivers/crypto/bcm/spu.c
> > > []
> > > > @@ -519,7 +519,7 @@ u32 spum_assoc_resp_len(enum spu_cipher_mode cipher_mode,
> > > >   * spu_aead_ivlen() - Calculate the length of the AEAD IV to be included
> > > >   * in a SPU request after the AAD and before the payload.
> > > >   * @cipher_mode:  cipher mode
> > > > - * @iv_ctr_len:   initialization vector length in bytes
> > > > + * @iv_len:   initialization vector length in bytes
> > > >   *
> > > >   * In Linux ~4.2 and later, the assoc_data sg includes the IV. So no need
> > > >   * to include the IV as a separate field in the SPU request msg.
> > > > @@ -917,7 +917,7 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
> > > >   * setkey() time in spu_cipher_req_init().
> > > >   * @spu_hdr:         Start of the request message header (MH field)
> > > >   * @spu_req_hdr_len: Length in bytes of the SPU request header
> > > > - * @isInbound:       0 encrypt, 1 decrypt
> > > > + * @is_inbound:       0 encrypt, 1 decrypt
> > >
> > > odd alignments
> >
> > Sorry to have missed these.
> >
> > > etc...
> >
> > Are there a lot of other such problems?  I did look through the whole
> > patch several times by hand, but perhaps it is just too big to see
> > everything.
>
> Probably the comments for spum_assoc_resp_len() could be tweaked.
>
> I had written an email about this one that Joe mentioned and
> spum_assoc_resp_len() but then I decided that it wasn't enough to worry
> about so I deleted the email instead of sending it.

OK, thanks.

julia
