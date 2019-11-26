From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 Nov 2019 12:52:58 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: unmap the correct pointer in i915_error_object_create()
Message-Id: <157477277885.15944.15314564966394699342@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126125003.zpczouqpyr7njwha@kili.mountain>
In-Reply-To: <20191126125003.zpczouqpyr7njwha@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruce Chang <yu.bruce.chang@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Dan Carpenter (2019-11-26 12:50:03)
> We should be unmapping "page" instead of "s".  This code originally used
> kmap_atomic() before it was changed to kmap().  The two mapping
> functions are different which leads to this common mistake.
> 
> Fixes: 3e749f5199e1 ("drm/i915: Avoid atomic context for error capture")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Caught by bae21dacd7b7 ("drm/i915: Switch kunmap() to take the page not
vaddr")

Thanks for smatch!
-Chris
