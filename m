From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Aug 2017 14:32:57 +0000
Subject: Re: [PATCH] drm/i915: Fix integer overflow tests
Message-Id: <20170817143257.m3ixmvq44aob2bqj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817062310.rc6ol2c5vttvrjlx@mwanda>
 <20170817093700.5srkwji7mxexouts@ideak-desk.fi.intel.com>
 <20170817094446.rwjpo5jo76oksjog@mwanda>
 <20170817095645.bqmz7hwsaw3s5h5b@ideak-desk.fi.intel.com>
 <CAOFGe948rzTWPr0ZNg7VP-nxDkMNdEU0qSfUA90XzsaEfyO2mg@mail.gmail.com>
In-Reply-To: <CAOFGe948rzTWPr0ZNg7VP-nxDkMNdEU0qSfUA90XzsaEfyO2mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Intel GFX <intel-gfx@lists.freedesktop.org>

On Thu, Aug 17, 2017 at 07:16:03AM -0700, Jason Ekstrand wrote:
> On Thu, Aug 17, 2017 at 2:56 AM, Imre Deak <imre.deak@intel.com> wrote:
> 
> > On Thu, Aug 17, 2017 at 12:50:37PM +0300, Dan Carpenter wrote:
> > > On Thu, Aug 17, 2017 at 12:37:00PM +0300, Imre Deak wrote:
> > > > On Thu, Aug 17, 2017 at 09:23:10AM +0300, Dan Carpenter wrote:
> > > > > There are some potential integer overflows here on 64 bit systems.
> > > > >
> > > > > The condition "if (nfences > SIZE_MAX / sizeof(*fences))" can only be
> > > > > true on 32 bit systems, it's a no-op on 64 bit, so let's ignore the
> > > > > check for now and look a couple lines after:
> > > > >
> > > > >   if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
> > > > >                                           ^^^^^^^^^^^
> > > > > "nfences" is an unsigned int, so if we set it to UINT_MAX and
> > multiply
> > > > > by two, it's going to have an integer overflow.
> > > >
> > > > AFAICS it wouldn't overflow due the promotion to unsigned long
> > > > by '* sizeof(u32)'.
> > > >
> > >
> > > It first multplies "nfences * 2" as unsigned int, then it type promotes
> > > to size_t and multiplies by sizeof().  Only the first multiplication has
> > > an integer overflow bug.
> >
> > Err, that's correct. Sorry for the noise.
> >
> 
> Why not just replace the "2 * sizeof(u32)" with a "sizeof(*user)".  That's
> what we really want to check.  I have no idea how it ended up being "2 *
> sizeof(u32)"

Yeah.  That's more readable.  I will resend.

regards,
dan carpenter


