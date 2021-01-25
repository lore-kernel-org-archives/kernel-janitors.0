From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 25 Jan 2021 09:44:53 +0000
Subject: Re: [PATCH] drm/i915/gvt: fix uninitialized return in intel_gvt_update_reg_whitelist()
Message-Id: <161156789392.31416.7341729779003502151@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6F3oF8mRaNQWjb@mwanda>
In-Reply-To: <YA6F3oF8mRaNQWjb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

Quoting Dan Carpenter (2021-01-25 08:48:30)
> Smatch found an uninitialized variable bug in this code:
> 
>     drivers/gpu/drm/i915/gvt/cmd_parser.c:3191 intel_gvt_update_reg_whitelist()
>     error: uninitialized symbol 'ret'.
> 
> The first thing that Smatch complains about is that "ret" isn't set if
> we don't enter the "for_each_engine(engine, &dev_priv->gt, id) {" loop.
> Presumably we always have at least one engine so that's a false
> positive.
> 
> But it's definitely a bug to not set "ret" if i915_gem_object_pin_map()
> fails.

True.
 
> Let's fix the bug and silence the false positive.
> 
> Fixes: 493f30cd086e ("drm/i915/gvt: parse init context to update cmd accessible reg whitelist")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
