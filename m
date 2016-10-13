From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 09:58:06 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: fix a read size argument
Message-Id: <20161013095806.GL5630@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085508.GJ16198@mwanda>
 <20161013090103.GC32528@nuc-i3427.alporthouse.com>
In-Reply-To: <20161013090103.GC32528@nuc-i3427.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, Oct 13, 2016 at 10:01:03AM +0100, Chris Wilson wrote:
> On Thu, Oct 13, 2016 at 11:55:08AM +0300, Dan Carpenter wrote:
> > We want to read 3 bytes here, but because the parenthesis are in the
> > wrong place we instead read:
> > 
> > 	sizeof(intel_dp->edp_dpcd) = sizeof(intel_dp->edp_dpcd)
> > 
> > which is one byte.
> > 
> > Fixes: fe5a66f91c88 ("drm/i915: Read PSR caps/intermediate freqs/etc. only once on eDP")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Oops, does smatch catch this?

Yeah.  It does.

regards,
dan carpenter

