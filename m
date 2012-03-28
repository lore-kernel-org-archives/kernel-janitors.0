From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 28 Mar 2012 11:18:21 +0000
Subject: Re: [patch] drm/i915/bios: cleanup return type of intel_parse_bios()
Message-Id: <20120328111821.GA27581@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120328065942.GC9113@elgon.mountain>
In-Reply-To: <20120328065942.GC9113@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Mar 28, 2012 at 09:59:42AM +0300, Dan Carpenter wrote:
> These are unintuitive.  These are type bool and return -1 casted to true
> on failure.  Let's just make it return an int.  The callers don't care,
> but let's change this as a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

... or split it up into psb and i915 so I can merge it through
drm-intel-next.
-Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
