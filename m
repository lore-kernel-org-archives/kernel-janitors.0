From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 05 May 2015 07:30:21 +0000
Subject: Re: [patch] drm/i915: checking IS_ERR() instead of NULL
Message-Id: <20150505073021.GZ30184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150430143050.GB22086@mwanda>
 <20150430144302.GB31838@nuc-i3427.alporthouse.com>
 <20150430144713.GD16501@mwanda>
In-Reply-To: <20150430144713.GD16501@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Apr 30, 2015 at 05:47:13PM +0300, Dan Carpenter wrote:
> On Thu, Apr 30, 2015 at 03:43:02PM +0100, Chris Wilson wrote:
> > On Thu, Apr 30, 2015 at 05:30:50PM +0300, Dan Carpenter wrote:
> > > We switched from calling i915_gem_alloc_context_obj() to calling
> > > i915_gem_alloc_object() so the error handling needs to be updated to
> > > check for NULL instead of IS_ERR().
> > 
> > I had a patch to change i915_gem_alloc_object() to report the correct
> > error rather than NULL - which can come in surprisingly handy at
> > times...
> 
> That also works, of course.  Send it.  :)

Doesn't seem to have shown up yet, I applied your patch meanwhile.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
