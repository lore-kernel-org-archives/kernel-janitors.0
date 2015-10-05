From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 05 Oct 2015 07:58:28 +0000
Subject: Re: [patch] drm/i915: unlock on error in i915_ppgtt_info()
Message-Id: <20151005080119.GN3383@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151002151422.GA6049@mwanda>
 <20151002152915.GA12329@bogon>
In-Reply-To: <20151002152915.GA12329@bogon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geliang Tang <geliangtang@163.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, Oct 02, 2015 at 11:29:16PM +0800, Geliang Tang wrote:
> On Fri, Oct 02, 2015 at 06:14:22PM +0300, Dan Carpenter wrote:
> > We need to call intel_runtime_pm_put() and mutex_unlock() before
> > returning.
> > 
> > Fixes: 7cb5dff8d59d ('drm/i915: fix task reference leak in i915_debugfs.c')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Geliang Tang <geliangtang@163.com>

Queued for -next, thanks for the patch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
