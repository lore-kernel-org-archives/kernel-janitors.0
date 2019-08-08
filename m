From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 08 Aug 2019 10:44:21 +0000
Subject: Re: [PATCH] drm/i915: Use after free in error path in intel_vgpu_create_workload()
Message-Id: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190808103236.GB30506@mwanda>
In-Reply-To: <20190808103236.GB30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Xiong Zhang <xiong.y.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

Quoting Dan Carpenter (2019-08-08 11:32:36)
> We can't free "workload" until after the printk or it's a use after
> free.
> 
> Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

That's the simpler patch,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
