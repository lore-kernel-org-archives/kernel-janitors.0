From: Joe Perches <joe@perches.com>
Date: Thu, 21 Aug 2014 17:44:44 +0000
Subject: Re: [PATCH] ioat: Use time_before()
Message-Id: <1408643084.23250.84.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400789466-11156-1-git-send-email-manuel.schoelling@gmx.de>
	 <CAPcyv4gnMVHd6R=WuN84TLxrAgsBAq8u9_PcmpgD8QECZMZAQw@mail.gmail.com>
In-Reply-To: <CAPcyv4gnMVHd6R=WuN84TLxrAgsBAq8u9_PcmpgD8QECZMZAQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <hidave.darkstar@gmail.com>
Cc: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>, Vinod Koul <vinod.koul@intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 2014-08-21 at 10:10 -0700, Dan Williams wrote:
> On Thu, May 22, 2014 at 1:11 PM, Manuel Sch=F6lling
> <manuel.schoelling@gmx.de> wrote:
> > To be future-proof and for better readability the time comparisons are =
modified
> > to use time_before() instead of plain, error-prone math.
[]
> > diff --git a/drivers/dma/ioat/dma_v2.c b/drivers/dma/ioat/dma_v2.c
[]
> > @@ -735,7 +735,8 @@ int ioat2_check_space_lock(struct ioat2_dma_chan *i=
oat, int num_descs)
> >          * called under bh_disabled so we need to trigger the timer
> >          * event directly
> >          */
> > -       if (jiffies > chan->timer.expires && timer_pending(&chan->timer=
)) {
> > +       if (time_before(chan->timer.expires, jiffies)
> > +           && timer_pending(&chan->timer)) {
> >                 struct ioatdma_device *device =3D chan->device;
>=20
> Thanks, let's use time_is_before_jiffies() for this cleanup... I'll
> fix up and apply.

There are thousands of uses of time_before( and time_after(
with jiffies, and 6 years after being added, a little more
than a dozen or so of time_is_[before|after]_jiffies.

I also think the "time_is_[before|after]_jiffies" macros are
not very well named.

Using them is more text than using jiffies directly.
There is a small benefit in argument ordering correctness.

	time_after(jiffies, foo)
	time_is_after_jiffies(foo)

I'd rather just drop jiffies altogether
	time_is_after(foo)
or maybe add and use
	jiffies_is_after(foo)

(all the other after_eq/before/before_eq variants too).

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
