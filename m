From: Joe Perches <joe@perches.com>
Date: Tue, 29 Sep 2020 22:21:57 +0000
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas to separate statements
Message-Id: <3b7457e4efd04865115152636ca65b5dc9cfe0e4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
         <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
         <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
         <c79b36c12c978d38f3ad89b1c659871a@perches.com>
         <alpine.DEB.2.22.394.2009291843560.2808@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2009291843560.2808@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Malcolm Priestley <tvboxspy@gmail.com>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2020-09-29 at 18:44 +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Joe Perches wrote:
> > On 2020-09-29 09:00, Christophe JAILLET wrote:
> > > Le 29/09/2020 =E0 15:14, Julia Lawall a =E9crit :
> > > > Replace commas with semicolons.  Commas introduce unnecessary
> > > > variability in the code structure and are hard to see.  What is done
> > > > is essentially described by the following Coccinelle semantic patch
> > > > (http://coccinelle.lip6.fr/):
> > > >=20
> > > > // <smpl>
> > > > @@ expression e1,e2; @@
> > > > e1
> > > > -,
> > > > +;
> > > > e2
> > > > ... when any
> > > > // </smpl>
> > > >=20
> > > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > > >=20
> > > > ---
> > > >   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > index 5a7a9522d46d..9ddda8d68ee0 100644
> > > > --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> > > > @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adap=
ter
> > > > *adap)
> > > >   	ep =3D usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
> > > >     	if (usb_endpoint_type(&ep->desc) =3D USB_ENDPOINT_XFER_BULK)
> > > > -		lme_int->lme_urb->pipe =3D usb_rcvbulkpipe(d->udev, 0xa),
> > > > +		lme_int->lme_urb->pipe =3D usb_rcvbulkpipe(d->udev, 0xa);
> > > >     	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
> > > >   	info("INT Interrupt Service Started");
> > > >=20
> > > >=20
> > > Ouch!
> > >=20
> > > This one looks like a real issue!
> >=20
> > Julia?  Did you do this one by hand?  This actually changes logic which=
 I did
> > not expectthe cocci script to do.
>=20
> No, I didn't do it by hand.  Did you already send this one?  Maybe I
> should resend it with a more informative log message.

I did not send a patch for this one.

Yes, I think you should say you are fixing
a likely defect here.
