From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 31 May 2019 10:40:27 +0000
Subject: Re: [PATCH][next] drm/i915: fix use of uninitialized pointer vaddr
Message-Id: <155929922781.27302.13050993726222660588@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531103201.10124-1-colin.king@canonical.com>
In-Reply-To: <20190531103201.10124-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-05-31 11:32:01)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of err is using the incorrect pointer vaddr that has
> not been initialized. Fix this by using the correct pointer obj instead.
> 
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: 6501aa4e3a45 ("drm/i915: add in-kernel blitter client")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed and pushed, thanks for the fix!
-Chris
