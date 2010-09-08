From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 08 Sep 2010 19:49:36 +0000
Subject: Re: [patch] i915: snprintf returns large values
Message-Id: <89k83a$9jej6t@azsmga001.ch.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908194447.GC3463@bicker>
In-Reply-To: <20100908194447.GC3463@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 8 Sep 2010 21:44:47 +0200, Dan Carpenter <error27@gmail.com> wrote:
> snprintf() returns the number of bytes which would have been used if
> there was enough space.  It can be larger than the size of the buffer.
> Obviously in this case the buffer is large enough but everyone just
> copy and pastes this code so it's better to limit it and set a good
> example.

Applied to drm-intel-next as it is just a pedagogical fix.
Thanks,
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
