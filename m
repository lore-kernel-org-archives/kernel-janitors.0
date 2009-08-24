From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 24 Aug 2009 08:17:33 +0000
Subject: Re: [Openipmi-developer] [PATCH] char/impi: adding __init macro/
Message-Id: <alpine.LNX.2.00.0908241017230.25797@wotan.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="168427776-1040654244-1251101854=:25797"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200908230146.56283.PeterHuewe@gmx.de> <4A9204B4.2030800@acm.org>
In-Reply-To: <4A9204B4.2030800@acm.org>
To: Corey Minyard <minyard@acm.org>
Cc: =?ISO-8859-15?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>, openipmi-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-1040654244-1251101854=:25797
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Aug 2009, Corey Minyard wrote:

> This is correct, I'm fine with it going through the trivial tree.  Thanks.
>=20
> Acked-by: Corey Minyard <minyard@acm.org>
>=20
> Peter H=FCwe wrote:
> > From: Peter Huewe <peterhuewe@gmx.de>
> >
> > Trivial patch which adds the __init to the module_init function of
> > drivers/char/ipmi/ipmy_poweroff.c and corrects the location of __exit f=
or
> > the
> > cleanup function.
> >
> > According to ldd3, page 31 the __exit token hast to be after the return
> > type.
> > Or am I getting something wrong here?
> >
> > Corey, please have a look at the small patch and either pull it through
> > your tree, or please ack' it so Jiri can pull it through the trivial tr=
ee.
> >
> > linux version 2.6.31-rc6 - linus git tree, So 23. Aug 01:38:43 CEST 2009
> >
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> > ---
> > diff --git a/drivers/char/ipmi/ipmi_poweroff.c
> > b/drivers/char/ipmi/ipmi_poweroff.c
> > index a261bd7..2e66b5f 100644
> > --- a/drivers/char/ipmi/ipmi_poweroff.c
> > +++ b/drivers/char/ipmi/ipmi_poweroff.c
> > @@ -691,7 +691,7 @@ static struct ctl_table_header *ipmi_table_header;
> >  /*
> >   * Startup and shutdown functions.
> >   */
> > -static int ipmi_poweroff_init(void)
> > +static int __init ipmi_poweroff_init(void)
> >  {
> >   int rv;
> >=20
> > @@ -725,7 +725,7 @@ static int ipmi_poweroff_init(void)
> >  }
> > =20
> >  #ifdef MODULE
> > -static __exit void ipmi_poweroff_cleanup(void)
> > +static void __exit ipmi_poweroff_cleanup(void)
> >  {
> >   int rv;

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs
--168427776-1040654244-1251101854=:25797--
