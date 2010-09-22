From: Greg KH <greg@kroah.com>
Date: Wed, 22 Sep 2010 15:50:04 +0000
Subject: Re: [PATCH 04/14] memstick: core: fix device_register() error
Message-Id: <20100922155004.GC26178@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900889-24369-1-git-send-email-segooon@gmail.com>
 <20100921152031.30365b3f.akpm@linux-foundation.org>
 <20100921224947.GA20183@kroah.com>
 <AANLkTimQWtQTBe3RBSbYd7vM4Y+SckkoBDbO8E+SwtJj@mail.gmail.com>
In-Reply-To: <AANLkTimQWtQTBe3RBSbYd7vM4Y+SckkoBDbO8E+SwtJj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, Dan Carpenter <error27@gmail.com>, Boaz Harrosh <bharrosh@panasas.com>

On Wed, Sep 22, 2010 at 10:53:21AM +0200, Kay Sievers wrote:
> On Wed, Sep 22, 2010 at 00:49, Greg KH <greg@kroah.com> wrote:
>=20
> > =A0int device_register(struct device *dev)
> > =A0{
> > + =A0 =A0 =A0 int retval;
> > +
> > =A0 =A0 =A0 =A0device_initialize(dev);
> > - =A0 =A0 =A0 return device_add(dev);
> > + =A0 =A0 =A0 retval =3D device_add(dev);
> > + =A0 =A0 =A0 if (retval)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_device(dev);
> > + =A0 =A0 =A0 return retval;
> > =A0}
>=20
> > Kay, what am I missing here, why can't we just do this? =A0Hm, the
> > side-affect might be that if device_register() fails, NO ONE had better
> > touch that device again, as it might have just been freed from the
> > system. =A0I wonder if that will cause problems...
>=20
> That looks right, besides that there might be callers already doing
> this. Which needs to be checked.

Yes, it would be.  I'll go through the tree.

> I never liked this pretty useless "convenience API", which just wraps
> two simple functions and the first one can never fail anyway.

Agreed.

> We better remove that device_register() stuff entirely in the long
> run, it's not doing any good. At the kobject level we killed the same
> stuff already long ago.

It's one of the things on my "to change" list.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
