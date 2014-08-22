From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 22 Aug 2014 16:52:49 +0000
Subject: Re: [PATCH] ioat: Use time_before()
Message-Id: <alpine.DEB.2.02.1408221851510.2055@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1777988654-1408726370=:2055"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400789466-11156-1-git-send-email-manuel.schoelling@gmx.de>  <CAPcyv4gnMVHd6R=WuN84TLxrAgsBAq8u9_PcmpgD8QECZMZAQw@mail.gmail.com> <1408643084.23250.84.camel@joe-AO725>
In-Reply-To: <1408643084.23250.84.camel@joe-AO725>
To: Joe Perches <joe@perches.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <hidave.darkstar@gmail.com>, =?ISO-8859-15?Q?Manuel_Sch=F6lling?= <manuel.schoelling@gmx.de>, Vinod Koul <vinod.koul@intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1777988654-1408726370=:2055
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Thu, 21 Aug 2014, Joe Perches wrote:

> On Thu, 2014-08-21 at 10:10 -0700, Dan Williams wrote:
> > On Thu, May 22, 2014 at 1:11 PM, Manuel Sch=F6lling
> > <manuel.schoelling@gmx.de> wrote:
> > > To be future-proof and for better readability the time comparisons ar=
e modified
> > > to use time_before() instead of plain, error-prone math.
> []
> > > diff --git a/drivers/dma/ioat/dma_v2.c b/drivers/dma/ioat/dma_v2.c
> []
> > > @@ -735,7 +735,8 @@ int ioat2_check_space_lock(struct ioat2_dma_chan =
*ioat, int num_descs)
> > >          * called under bh_disabled so we need to trigger the timer
> > >          * event directly
> > >          */
> > > -       if (jiffies > chan->timer.expires && timer_pending(&chan->tim=
er)) {
> > > +       if (time_before(chan->timer.expires, jiffies)
> > > +           && timer_pending(&chan->timer)) {
> > >                 struct ioatdma_device *device =3D chan->device;
> >=20
> > Thanks, let's use time_is_before_jiffies() for this cleanup... I'll
> > fix up and apply.
>=20
> There are thousands of uses of time_before( and time_after(
> with jiffies, and 6 years after being added, a little more
> than a dozen or so of time_is_[before|after]_jiffies.
>=20
> I also think the "time_is_[before|after]_jiffies" macros are
> not very well named.
>=20
> Using them is more text than using jiffies directly.
> There is a small benefit in argument ordering correctness.
>=20
> 	time_after(jiffies, foo)
> 	time_is_after_jiffies(foo)
>=20
> I'd rather just drop jiffies altogether
> 	time_is_after(foo)
> or maybe add and use
> 	jiffies_is_after(foo)

jiffies_is_after is very understandable.  The others seem to require some=20
thought.

julia
--8323328-1777988654-1408726370=:2055--
