From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Aug 2017 09:50:37 +0000
Subject: Re: [PATCH] drm/i915: Fix integer overflow tests
Message-Id: <20170817094446.rwjpo5jo76oksjog@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817062310.rc6ol2c5vttvrjlx@mwanda>
 <20170817093700.5srkwji7mxexouts@ideak-desk.fi.intel.com>
In-Reply-To: <20170817093700.5srkwji7mxexouts@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Aug 17, 2017 at 12:37:00PM +0300, Imre Deak wrote:
> On Thu, Aug 17, 2017 at 09:23:10AM +0300, Dan Carpenter wrote:
> > There are some potential integer overflows here on 64 bit systems.
> > 
> > The condition "if (nfences > SIZE_MAX / sizeof(*fences))" can only be
> > true on 32 bit systems, it's a no-op on 64 bit, so let's ignore the
> > check for now and look a couple lines after:
> > 
> > 	if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
> >                                           ^^^^^^^^^^^
> > "nfences" is an unsigned int, so if we set it to UINT_MAX and multiply
> > by two, it's going to have an integer overflow.  
> 
> AFAICS it wouldn't overflow due the promotion to unsigned long
> by '* sizeof(u32)'.
> 

It first multplies "nfences * 2" as unsigned int, then it type promotes
to size_t and multiplies by sizeof().  Only the first multiplication has
an integer overflow bug.

regards,
dan carpenter

