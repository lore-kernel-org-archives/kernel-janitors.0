From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 19 Dec 2019 19:43:06 +0000
Subject: Re: [PATCH][next] drm/i915: fix uninitialized pointer reads on pointers to and from
Message-Id: <157678458608.6469.7303602517496484124@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191219190916.24693-1-colin.king@canonical.com>
In-Reply-To: <20191219190916.24693-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-12-19 19:09:16)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointers to and from are not initialized and may contain
> garbage values. This will cause uninitialized pointer reads in the
> call to intel_frontbuffer_track and later checks to see if to and from
> are null.  Fix this by ensuring to and from are initialized to NULL.
> 
> Addresses-Coverity: ("Uninitialised pointer read)"
> Fixes: da42104f589d ("drm/i915: Hold reference to intel_frontbuffer as we track activity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

"D'oh"
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
