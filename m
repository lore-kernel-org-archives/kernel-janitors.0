From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 09 Oct 2019 10:15:42 +0000
Subject: Re: [PATCH][next] drm/i915/selftests: fix null pointer dereference on pointer data
Message-Id: <157061614282.18808.3604540678077210321@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009100024.23077-1-colin.king@canonical.com>
In-Reply-To: <20191009100024.23077-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-10-09 11:00:24)
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where data fails to be allocated the error exit path is
> via label 'out' where data is dereferenced in a for-loop.  Fix this
> by exiting via the label 'out_file' instead to avoid the null pointer
> dereference.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 50d16d44cce4 ("drm/i915/selftests: Exercise context switching in parallel")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
