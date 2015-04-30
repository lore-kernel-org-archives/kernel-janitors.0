From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 30 Apr 2015 14:43:02 +0000
Subject: Re: [patch] drm/i915: checking IS_ERR() instead of NULL
Message-Id: <20150430144302.GB31838@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150430143050.GB22086@mwanda>
In-Reply-To: <20150430143050.GB22086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Apr 30, 2015 at 05:30:50PM +0300, Dan Carpenter wrote:
> We switched from calling i915_gem_alloc_context_obj() to calling
> i915_gem_alloc_object() so the error handling needs to be updated to
> check for NULL instead of IS_ERR().

I had a patch to change i915_gem_alloc_object() to report the correct
error rather than NULL - which can come in surprisingly handy at
times...
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
