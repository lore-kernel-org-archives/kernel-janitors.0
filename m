From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 29 Sep 2020 16:43:40 +0000
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2009291840470.2808@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-933603108-1601397814=:2808"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr> <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr> <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
In-Reply-To: <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Malcolm Priestley <tvboxspy@gmail.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-933603108-1601397814=:2808
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.22.394.2009291843371.2808@hadrien>



On Tue, 29 Sep 2020, Christophe JAILLET wrote:

> Le 29/09/2020 =E0 15:14, Julia Lawall a =E9crit=A0:
> > Replace commas with semicolons.  Commas introduce unnecessary
> > variability in the code structure and are hard to see.  What is done
> > is essentially described by the following Coccinelle semantic patch
> > (http://coccinelle.lip6.fr/):
> >
> > // <smpl>
> > @@ expression e1,e2; @@
> > e1
> > -,
> > +;
> > e2
> > ... when any
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > index 5a7a9522d46d..9ddda8d68ee0 100644
> > --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter
> > *adap)
> >   	ep =3D usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
> >     	if (usb_endpoint_type(&ep->desc) =3D=3D USB_ENDPOINT_XFER_BULK)
> > -		lme_int->lme_urb->pipe =3D usb_rcvbulkpipe(d->udev, 0xa),
> > +		lme_int->lme_urb->pipe =3D usb_rcvbulkpipe(d->udev, 0xa);
> >     	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
> >   	info("INT Interrupt Service Started");
> >
> >
> Ouch!
>
> This one looks like a real issue!

Oops, yes, I meant to make a comment about it.

Joe may have sent this patch already.  At least he has sent a patch on an
issue like this.

julia
--8323329-933603108-1601397814=:2808--
