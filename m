From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 07 Oct 2019 21:49:43 +0000
Subject: Re: [PATCH] drm/i915: make array hw_engine_mask static, makes object smaller
Message-Id: <157048498331.8520.2832276261708225981@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007154151.23245-1-colin.king@canonical.com>
 <157046537209.5063.10118308844290609426@skylake-alporthouse-com>
In-Reply-To: <157046537209.5063.10118308844290609426@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Chris Wilson (2019-10-07 17:22:52)
> Quoting Colin King (2019-10-07 16:41:51)
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Don't populate the array hw_engine_mask on the stack but instead make it
> > static. Makes the object code smaller by 316 bytes.
> > 
> > Before:
> >    text    data     bss     dec     hex filename
> >   34004    4388     320   38712    9738 gpu/drm/i915/gt/intel_reset.o
> > 
> > After:
> >    text    data     bss     dec     hex filename
> >   33528    4548     320   38396    95fc gpu/drm/i915/gt/intel_reset.o
> > 
> > (gcc version 9.2.1, amd64)
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

And pushed, thanks for the patch.
-Chris
