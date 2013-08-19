From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 19 Aug 2013 07:40:16 +0000
Subject: Re: [patch] drm/i915: use _safe version of list_for_each
Message-Id: <20130819074016.GB7784@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130819065323.GA28591@elgon.mountain>
In-Reply-To: <20130819065323.GA28591@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Aug 19, 2013 at 09:53:23AM +0300, Dan Carpenter wrote:
> We sometimes call i915_vma_unbind() inside the loop and that can free
> the vma.

Oh. That is bad. The vma needs to be pinned here to prevent it being freed as
otherwise we lose track of it during the execbuffer.
Ben?
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
