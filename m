From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 15 Apr 2017 09:32:09 +0000
Subject: Re: [PATCH v2] drm/i915: set "ret" correctly on error paths
Message-Id: <20170415093209.GD12532@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413202924.GY12532@nuc-i3427.alporthouse.com>
 <20170414195425.GA8144@mwanda>
In-Reply-To: <20170414195425.GA8144@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Apr 14, 2017 at 10:54:25PM +0300, Dan Carpenter wrote:
> If "crtc" is NULL, then my static checker complains that "ret" isn't
> initialized on that path.  It doesn't really cause a problem unless
> "ret" is somehow set to -EDEADLK which is not likely.
> 
> Chris Wilson also noticed another error path where "ret" isn't set
> correctly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Pushed, thanks very much for the patch.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
