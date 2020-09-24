From: Christoph Hellwig <hch@lst.de>
Date: Thu, 24 Sep 2020 08:26:52 +0000
Subject: Re: [PATCH] drm/i915: Uninitialized variable in i915_gem_object_map_page()
Message-Id: <20200924082652.GA14084@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200924081830.GA1568157@mwanda>
In-Reply-To: <20200924081830.GA1568157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>

On Thu, Sep 24, 2020 at 11:18:30AM +0300, Dan Carpenter wrote:
> The "i" iterator is never set to zero.  This probably doesn't affect
> testing because GCC sometimes initializes variables and also we have a
> new pluggin to initialize stack variables to zero.
> 
> Fixes: 7edd32a9e614 ("drm/i915: use vmap in i915_gem_object_map")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Andrew, this should probably go through the -mm tree and get folded
> into the original patch.

FYI, I'll need to resend anyway, and I've folded this into the latest
branch.
