From: Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 07 Jan 2019 08:42:00 +0000
Subject: Re: [PATCH] drm/etnaviv: fix some off by one bugs
Message-Id: <1546850520.3580.1.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145631.qxd3pzk72v4bshii@kili.mountain>
 <20181221202406.GF2240@kadam>
 <CAKMK7uFfNch70k5O+OmqMpDsO7V1ADiF1Yo4Vv+K5eDSR9L0mA@mail.gmail.com>
In-Reply-To: <CAKMK7uFfNch70k5O+OmqMpDsO7V1ADiF1Yo4Vv+K5eDSR9L0mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Daniel Vetter <daniel@ffwll.ch>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>

Hi Daniel,

Am Montag, den 24.12.2018, 10:32 +0100 schrieb Daniel Vetter:
> On Fri, Dec 21, 2018 at 9:24 PM Dan Carpenter <dan.carpenter@oracle.c
> om> wrote:
> > 
> > I don't think anyone responded to this one?
> 
> Maybe time to move etnaviv into drm-misc so that there's a notch more
> redundancy in maintainers? Lucas, Christian, others?

Sorry, but no thanks. The current model guarantees that we have at
least some testing of the patches flowing through the etnaviv tree with
realworld use-cases. We certainly don't have the resources to track a
rapidly changing target like drm-misc with our testing.

Regards,
Lucas

> -Daniel
> 
> > 
> > regards,
> > dan carpenter
> > 
> > On Fri, Jul 13, 2018 at 06:00:18PM +0300, Dan Carpenter wrote:
> > > The ->nr_signal is the supposed to be the number of elements in
> > > the
> > > ->signal array.  There was one place where it was 5 but it was
> > > supposed
> > > to be 4.  That looks like a copy and paste bug.  There were also
> > > two
> > > checks that were off by one.
> > > 
> > > Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query
> > > perf counter")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > Not tested.
> > > 
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > index 9980d81a26e3..4227a4006c34 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > @@ -113,7 +113,7 @@ static const struct etnaviv_pm_domain
> > > doms_3d[] = {
> > >               .name = "PE",
> > >               .profile_read = VIVS_MC_PROFILE_PE_READ,
> > >               .profile_config = VIVS_MC_PROFILE_CONFIG0,
> > > -             .nr_signals = 5,
> > > +             .nr_signals = 4,
> > >               .signal = (const struct etnaviv_pm_signal[]) {
> > >                       {
> > >                               "PIXEL_COUNT_KILLED_BY_COLOR_PIPE",
> > > @@ -435,7 +435,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu
> > > *gpu,
> > > 
> > >       dom = meta->domains + signal->domain;
> > > 
> > > -     if (signal->iter > dom->nr_signals)
> > > +     if (signal->iter >= dom->nr_signals)
> > >               return -EINVAL;
> > > 
> > >       sig = &dom->signal[signal->iter];
> > > @@ -461,7 +461,7 @@ int etnaviv_pm_req_validate(const struct
> > > drm_etnaviv_gem_submit_pmr *r,
> > > 
> > >       dom = meta->domains + r->domain;
> > > 
> > > -     if (r->signal > dom->nr_signals)
> > > +     if (r->signal >= dom->nr_signals)
> > >               return -EINVAL;
> > > 
> > >       return 0;
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
