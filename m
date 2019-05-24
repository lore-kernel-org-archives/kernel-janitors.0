From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 24 May 2019 21:45:06 +0000
Subject: Re: [PATCH][next] drm/i915/gtt: set err to -ENOMEM on memory allocation failure
Message-Id: <155873430650.6190.1054401334708975483@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190524212627.24256-1-colin.king@canonical.com>
In-Reply-To: <20190524212627.24256-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-05-24 22:26:27)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the allocation of ppgtt->work fails the error return
> path via err_free returns an uninitialized value in err. Fix this
> by setting err to the appropriate error return of -ENOMEM.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d3622099c76f ("drm/i915/gtt: Always acquire struct_mutex for gen6_ppgtt_cleanup")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Saw that last night but got distracted by the panic-on-boot...
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
