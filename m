From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 13 Jul 2020 14:46:35 +0000
Subject: Re: [PATCH][next] drm/i915/selftest: fix an error return path where err is not being set
Message-Id: <159465159599.23097.17150763550392763778@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713142551.423649-1-colin.king@canonical.com>
In-Reply-To: <20200713142551.423649-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-07-13 15:25:51)
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an error condition where err is not being set and an uninitialized
> garbage value in err is being returned.  Fix this by assigning err to an
> appropriate error return value before taking the error exit path.
> 
> Addresses-Coverity: ("Uninitialized scalar value")
> Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, pushed.
-Chris
