From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Oct 2016 09:01:03 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: fix a read size argument
Message-Id: <20161013090103.GC32528@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085508.GJ16198@mwanda>
In-Reply-To: <20161013085508.GJ16198@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Oct 13, 2016 at 11:55:08AM +0300, Dan Carpenter wrote:
> We want to read 3 bytes here, but because the parenthesis are in the
> wrong place we instead read:
> 
> 	sizeof(intel_dp->edp_dpcd) = sizeof(intel_dp->edp_dpcd)
> 
> which is one byte.
> 
> Fixes: fe5a66f91c88 ("drm/i915: Read PSR caps/intermediate freqs/etc. only once on eDP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, does smatch catch this? I don't recall seeing the complaint in
recent runs?

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
