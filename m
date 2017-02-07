From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Tue, 07 Feb 2017 14:34:57 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <1486478097.3121.120.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131630.GA28207@mwanda>
In-Reply-To: <20170207131630.GA28207@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Jike Song <jike.song@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

On ti, 2017-02-07 at 16:16 +0300, Dan Carpenter wrote:
> If "caps.buf" is already NULL then it doesn't need to be freed or set to
> NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

<SNIP>

> @@ -965,11 +965,8 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
>  			sparse->areas[0].offset >  					PAGE_ALIGN(vgpu_aperture_offset(vgpu));
>  			sparse->areas[0].size = vgpu_aperture_sz(vgpu);
> -			if (!caps.buf) {

Looking at the code around, the right thing would be to just remove the
negation? This currently seems like a memory leak.

> -				kfree(caps.buf);
> -				caps.buf = NULL;
> +			if (!caps.buf)
>  				caps.size = 0;
> -			}

And quickly looking, the caps is pre-initialized but unused at this
point, so the whole if could just be removed, right?

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
