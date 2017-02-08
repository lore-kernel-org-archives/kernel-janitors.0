From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Wed, 08 Feb 2017 12:49:22 +0000
Subject: Re: [Intel-gfx] [patch v2] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <1486558162.3142.44.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207145307.GA28648@mwanda>
In-Reply-To: <20170207145307.GA28648@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Jike Song <jike.song@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

On ti, 2017-02-07 at 17:53 +0300, Dan Carpenter wrote:
> "caps.buf" is always NULL here and "caps.size" is always zero.  The code
> is a no-op and can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

I assume Zhenyu will merge this through their tree.

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
