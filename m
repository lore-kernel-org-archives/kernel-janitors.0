From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 24 Sep 2013 09:25:22 +0000
Subject: Re: [patch] drm/i915: precendence bug in GT_PARITY_ERROR()
Message-Id: <20130924092522.GI13668@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130924075735.GB29141@elgon.mountain>
 <87eh8e6333.fsf@intel.com>
In-Reply-To: <87eh8e6333.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Sep 24, 2013 at 11:22:56AM +0300, Jani Nikula wrote:
> On Tue, 24 Sep 2013, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > The | operation has higher precedence than "?:" so the macro always
> > returns GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> Introduced in
> commit 35a85ac60618521d41cfdb14f3fbfc8ad7329e9e
> Author: Ben Widawsky <benjamin.widawsky@intel.com>
> Date:   Thu Sep 19 11:13:41 2013 -0700
> 
>     drm/i915: Add second slice l3 remapping
> 
> which hasn't been merged to Linus' tree yet.

Queued for -next, thanks for the patch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
