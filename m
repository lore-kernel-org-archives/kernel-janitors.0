From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 08 Aug 2014 16:22:09 +0000
Subject: Re: [PATCH] block: add abort on failure
Message-Id: <alpine.DEB.2.10.1408081821110.2348@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1681931489-1407514929=:2348"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407486050-9375-1-git-send-email-Julia.Lawall@lip6.fr> <alpine.DEB.2.10.1408081129150.2348@hadrien> <OF8E178B75.111E73DE-ON86257D2E.00561BEC-86257D2E.00590C0D@us.ibm.com>
In-Reply-To: <OF8E178B75.111E73DE-ON86257D2E.00561BEC-86257D2E.00590C0D@us.ibm.com>
To: Josh Morris <josh.h.morris@us.ibm.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, kernel-janitors@vger.kernel.org, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1681931489-1407514929=:2348
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable



On Fri, 8 Aug 2014, Josh Morris wrote:

> Howdy Julia,
>
> It is by design that we complete the probe despite failures in
> rsxx_load_config() and rsxx_get_num_targets(). The reason is that we will=
 be
> unable to debug and fix the issue without a driver loaded.
>
> In the case that the on-card config has been corrupted we will need the
> driver loaded to reset or repair the configuration.
>
> I couldn't find a place where we were derefrencing card->ctrl outside of a
> loop that checked the index against n_targets. That should prevent the
> driver from dereferencing an 0 size array. =A0So I believe we still want =
the
> probe to complete in this case so we can debug the hardware.

OK.  I also looked for such a reference and didn't see one.

Thanks for the feedback.

julia

>
> Cheers!
>
> Josh
>
>
>
> From: =A0 =A0 =A0 =A0Julia Lawall <julia.lawall@lip6.fr>
> To: =A0 =A0 =A0 =A0Josh Morris/Houston/IBM@IBMUS,
> Cc: =A0 =A0 =A0 =A0Jeff Moyer <jmoyer@redhat.com>, kernel-janitors@vger.k=
ernel.org,
> Philip Kelleher <pjk1939@linux.vnet.ibm.com>, dan.carpenter@oracle.com,
> linux-kernel@vger.kernel.org
> Date: =A0 =A0 =A0 =A008/08/2014 04:31 AM
> Subject: =A0 =A0 =A0 =A0Re: [PATCH] block: add abort on failure
>
> _________________________________________________________________________=
___
>
>
>
> On Fri, 8 Aug 2014, Julia Lawall wrote:
>
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > Initializing card seems to be critical to the rest of the probe process,
> so
> > abort the probe function if the calls to rsxx_load_config and
> > rsxx_get_num_targets do not succeed.
>
> Note that this is not tested. =A0Nevertheless, at least the first failure
> will leave card in an unknown partially initialized state, which seems
> undesirable.
>
> julia
>
>
> > Suggested by Jeff Moyer.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > =A0drivers/block/rsxx/core.c | =A0 =A08 ++++++--
> > =A01 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
> > index a8de2ee..ae2805b 100644
> > --- a/drivers/block/rsxx/core.c
> > +++ b/drivers/block/rsxx/core.c
> > @@ -915,15 +915,19 @@ static int rsxx_pci_probe(struct pci_dev *dev,
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /************* Load Card Config ***=
**********/
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st =3D rsxx_load_config(card);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (st)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (st) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
dev_err(CARD_TO_DEV(card),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Failed loading card
> config\n");
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0go=
to failed_dma_setup;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /************* Setup DMA Engine ***=
**********/
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st =3D rsxx_get_num_targets(card, &=
card->n_targets);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (st)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (st) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
dev_info(CARD_TO_DEV(card),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Failed reading the
> number of DMA targets\n");
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0go=
to failed_dma_setup;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 card->ctrl =3D kzalloc(card->n_targ=
ets *
> sizeof(*card->ctrl), GFP_KERNEL);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!card->ctrl) {
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janito=
rs"
> in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> >
>
>
>
>
--8323329-1681931489-1407514929=:2348--
