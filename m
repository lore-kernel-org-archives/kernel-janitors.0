From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Aug 2017 08:01:03 +0000
Subject: Re: [PATCH v2] drm/i915: Fix integer overflow tests
Message-Id: <20170818080103.onzmbiyobjt6yhhg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818064054.tjp7mqxzuwbruvj7@mwanda>
 <150304238594.1452.15324933027021845692@mail.alporthouse.com>
In-Reply-To: <150304238594.1452.15324933027021845692@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Aug 18, 2017 at 08:46:25AM +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2017-08-18 08:07:00)
> > There are some potential integer overflows here on 64 bit systems.
> > 
> > The condition "if (nfences > SIZE_MAX / sizeof(*fences))" can only be
> > true on 32 bit systems, it's a no-op on 64 bit, so let's ignore the
> > check for now and look a couple lines after:
> > 
> >         if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
> >                                           ^^^^^^^^^^^
> > "nfences" is an unsigned int, so if we set it to UINT_MAX and multiply
> > by two, it's going to have an integer overflow.  The multiplication by
> > sizeof(u32) is OK because that gets type promoted to size_t.  This patch
> > changes the access_ok() check to use sizeof(*user) which fixes the
> > integer overflow and is also more readable.
> > 
> > The "args->buffer_count" variable is an unsigned int as well so it could
> > overflow if it's set to UINT_MAX when we do:
> > 
> >         exec2_list = kvmalloc_array(args->buffer_count + 1, sz,
> >                                     ^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Originally, those two integer overflow checks were against UINT_MAX
> > instead of SIZE_MAX and this patch changes them back.
> > 
> > Fixes: 2889caa92321 ("drm/i915: Eliminate lots of iterations over the execobjects array")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Use sizeof(*users)
> 
> Please do consider my alternative.

I don't think you sent the email?  I haven't recieved any emails from
you on either my oracle.com address or through the kernel janitors list.

Can you resend?

regards
dan carpenter

