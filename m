From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 19 May 2017 19:37:54 +0000
Subject: Re: [PATCH][drm-next] drm/i915: Check for allocation failure
Message-Id: <20170519193754.GA15989@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519175617.7036-1-colin.king@canonical.com>
In-Reply-To: <20170519175617.7036-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 19, 2017 at 06:56:17PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The memory allocation for C is not being null checked and hence we
> could end up with a null pointer dereference. Fix this with a null
> pointer check. (I really should have noticed this when I was fixing an
> earlier issue.)
> 
> Detected by CoverityScan, CID#1436406 ("Dereference null return")
> 
> Fixes: 47624cc3301b60 ("drm/i915: Import the kfence selftests for i915_sw_fence")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed, thanks very much for the patch.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
