From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2019 15:35:52 +0000
Subject: Re: [PATCH] drm/i915/selftests: Fix an IS_ERR() vs NULL check
Message-Id: <20190326153552.GJ32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190326050843.GA20038@kadam> <87lg12yoby.fsf@gaia.fi.intel.com>
 <155361202926.15930.11426631316977293070@skylake-alporthouse-com>
In-Reply-To: <155361202926.15930.11426631316977293070@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tdz@users.sourceforge.net>, dri-devel@lists.freedesktop.org

On Tue, Mar 26, 2019 at 02:53:49PM +0000, Chris Wilson wrote:
> Quoting Mika Kuoppala (2019-03-26 09:30:57)
> > Dan Carpenter <dan.carpenter@oracle.com> writes:
> > 
> > > The live_context() function returns error pointers.  It never returns
> > > NULL.
> > >
> > > Fixes: 9c1477e83e62 ("drm/i915/selftests: Exercise adding requests to a full GGTT")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > 
> > i915_request.c has another :)
> 
> Having found it, you could have typed up the patch :-p
> 

Smatch didn't warn about that one because we didn't dereference it right
away...  I should make a check which complains about the condition
instead of the dereference.

regards,
dan carpenter
