From: Andi Shyti <andi.shyti@intel.com>
Date: Wed, 29 Apr 2020 14:04:43 +0000
Subject: Re: [PATCH] drm/i915/selftests: fix error handling in __live_lrc_indirect_ctx_bb()
Message-Id: <20200429140443.GC5168@intel.intel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429132425.GE815283@mwanda>
In-Reply-To: <20200429132425.GE815283@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>

Hi Dan,

On Wed, Apr 29, 2020 at 04:24:25PM +0300, Dan Carpenter wrote:
> If intel_context_create() fails then it leads to an error pointer
> dereference.  I shuffled things around to make error handling easier.
> 
> Fixes: 1dd47b54baea ("drm/i915: Add live selftests for indirect ctx batchbuffers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
