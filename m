From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 15:30:51 +0000
Subject: Re: [PATCH 15/38] drivers/infiniband: Use time_before, time_before_eq,
Message-Id: <Pine.LNX.4.64.0712241630030.23999@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-812127195-1198510251=:23999"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241528140.23999@ask.diku.dk>
 <20071225.002900.00703855.yoshfuji@linux-ipv6.org>
In-Reply-To: <20071225.002900.00703855.yoshfuji@linux-ipv6.org>
To: YOSHIFUJI Hideaki / =?iso-2022-jp?B?GyRCNUhGIzFRTEAbKEI=?= <yoshfuji@linux-ipv6.org>
Cc: rolandd@cisco.com, mshefty@ichips.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-812127195-1198510251=:23999
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Dec 2007, YOSHIFUJI Hideaki / =B5=C8=C6=A3=B1=D1=CC=C0 wrote:

> In article <Pine.LNX.4.64.0712241528140.23999@ask.diku.dk> (at Mon, 24 De=
c 2007 15:28:42 +0100 (CET)), Julia Lawall <julia@diku.dk> says:
>=20
> > diff -r -u -p a/drivers/infiniband/hw/ipath/ipath_mad.c b/drivers/infin=
iband/hw/ipath/ipath_mad.c
> > --- a/drivers/infiniband/hw/ipath/ipath_mad.c	2007-10-22 11:25:09.00000=
0000 +0200
> > +++ b/drivers/infiniband/hw/ipath/ipath_mad.c	2007-12-23 20:35:37.00000=
0000 +0100
> > @@ -1334,7 +1334,8 @@ static int process_subn(struct ib_device
> >  	}
> > =20
> >  	/* Is the mkey in the process of expiring? */
> > -	if (dev->mkey_lease_timeout && jiffies >=3D dev->mkey_lease_timeout) {
> > +	if (dev->mkey_lease_timeout &&
> > +	    time_before_eq(jiffies, dev->mkey_lease_timeout)) {
> >  		/* Clear timeout and mkey protection field. */
> >  		dev->mkey_lease_timeout =3D 0;
> >  		dev->mkeyprot =3D 0;
>=20
> time_after_eq()

I see that there are quite a lot of problems like this.  I will have to=20
start over...

julia

---511516320-812127195-1198510251=:23999--
