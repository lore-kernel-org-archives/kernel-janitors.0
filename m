From: Andi Shyti <andi.shyti@intel.com>
Date: Mon, 11 Jan 2021 15:31:35 +0000
Subject: Re: [PATCH v2] drm/i915: selftest_lrc: Fix error code in live_preempt_user()
Message-Id: <X/xvV6IqusOkKGdD@intel.intel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <161037060292.28181.5373987654669273170@build.alporthouse.com>
 <X/xeIMP16sDekYrh@mwanda>
In-Reply-To: <X/xeIMP16sDekYrh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Dan,

On Mon, Jan 11, 2021 at 05:18:08PM +0300, Dan Carpenter wrote:
> This error path should return a negative error code instead of success.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
