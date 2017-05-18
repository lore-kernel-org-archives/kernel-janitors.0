From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 18 May 2017 13:52:44 +0000
Subject: Re: [PATCH] drm/i915: Check C for null pointer rather than B
Message-Id: <20170518135244.GF26693@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518133942.5660-1-colin.king@canonical.com>
In-Reply-To: <20170518133942.5660-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Mika Kuoppala <mika.kuoppala@intel.com>

On Thu, May 18, 2017 at 02:39:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two occasions where pointer B is being check for a NULL
> when it should be pointer C instead. Fix these.
> 
> Detected by CoverityScan, CID#1436348,1436349 ("Logically Dead Code")
> 
> Fixes: 47624cc3301b60 ("drm/i915: Import the kfence selftests for i915_sw_fence")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, obviously correct and not exercised by BAT so pushed.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
