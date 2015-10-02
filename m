From: Geliang Tang <geliangtang@163.com>
Date: Fri, 02 Oct 2015 15:29:16 +0000
Subject: Re: [patch] drm/i915: unlock on error in i915_ppgtt_info()
Message-Id: <20151002152915.GA12329@bogon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151002151422.GA6049@mwanda>
In-Reply-To: <20151002151422.GA6049@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Oct 02, 2015 at 06:14:22PM +0300, Dan Carpenter wrote:
> We need to call intel_runtime_pm_put() and mutex_unlock() before
> returning.
> 
> Fixes: 7cb5dff8d59d ('drm/i915: fix task reference leak in i915_debugfs.c')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Geliang Tang <geliangtang@163.com>

