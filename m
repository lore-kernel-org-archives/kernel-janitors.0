From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Apr 2017 20:26:51 +0000
Subject: Re: [PATCH] drm/i915: checking for NULL instead of IS_ERR() in mock selftests
Message-Id: <20170413202651.GX12532@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413195217.GA26108@mwanda>
In-Reply-To: <20170413195217.GA26108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, Apr 13, 2017 at 10:52:17PM +0300, Dan Carpenter wrote:
> i915_gem_request_alloc() uses error pointers.  It never returns NULLs.
> 
> Fixes: 0daf0113cff6 ("drm/i915: Mock infrastructure for request emission")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks for the catch.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
