From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 Mar 2019 14:53:49 +0000
Subject: Re: [PATCH] drm/i915/selftests: Fix an IS_ERR() vs NULL check
Message-Id: <155361202926.15930.11426631316977293070@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190326050843.GA20038@kadam> <87lg12yoby.fsf@gaia.fi.intel.com>
In-Reply-To: <87lg12yoby.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>, Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tdz@users.sourceforge.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>

Quoting Mika Kuoppala (2019-03-26 09:30:57)
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > The live_context() function returns error pointers.  It never returns
> > NULL.
> >
> > Fixes: 9c1477e83e62 ("drm/i915/selftests: Exercise adding requests to a full GGTT")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> 
> i915_request.c has another :)

Having found it, you could have typed up the patch :-p

Thanks for the fix, pushed.
-Chris
