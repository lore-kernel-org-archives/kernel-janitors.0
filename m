From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 23 Sep 2010 12:10:24 +0000
Subject: Re: [PATCH 04/14] memstick: core: fix device_register() error
Message-Id: <20100923121024.GA26888@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900889-24369-1-git-send-email-segooon@gmail.com>
 <20100921152031.30365b3f.akpm@linux-foundation.org>
 <20100921224947.GA20183@kroah.com>
 <AANLkTimQWtQTBe3RBSbYd7vM4Y+SckkoBDbO8E+SwtJj@mail.gmail.com>
 <20100922155004.GC26178@kroah.com>
In-Reply-To: <20100922155004.GC26178@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <greg@kroah.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, Dan Carpenter <error27@gmail.com>, Boaz Harrosh <bharrosh@panasas.com>

On Wed, Sep 22, 2010 at 08:50 -0700, Greg KH wrote:
> On Wed, Sep 22, 2010 at 10:53:21AM +0200, Kay Sievers wrote:
> > On Wed, Sep 22, 2010 at 00:49, Greg KH <greg@kroah.com> wrote:
> >=20
> > > =A0int device_register(struct device *dev)
> > > =A0{
> > > + =A0 =A0 =A0 int retval;
> > > +
> > > =A0 =A0 =A0 =A0device_initialize(dev);
> > > - =A0 =A0 =A0 return device_add(dev);
> > > + =A0 =A0 =A0 retval =3D device_add(dev);
> > > + =A0 =A0 =A0 if (retval)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_device(dev);
> > > + =A0 =A0 =A0 return retval;
> > > =A0}
> >=20
> > > Kay, what am I missing here, why can't we just do this? =A0Hm, the
> > > side-affect might be that if device_register() fails, NO ONE had bett=
er
> > > touch that device again, as it might have just been freed from the
> > > system. =A0I wonder if that will cause problems...
> >=20
> > That looks right, besides that there might be callers already doing
> > this. Which needs to be checked.
>=20
> Yes, it would be.  I'll go through the tree.

As I see with this in-device_register patch we should check for 2 things:

1) nobody should call put_device() because of failed device_register().

2) dev has to be already got, other words its ref counter should not be zer=
o.

Correct?

--=20
Vasiliy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
