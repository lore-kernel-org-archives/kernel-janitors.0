From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 23 Mar 2017 12:39:00 +0000
Subject: Re: [PATCH] drm/i915/kvmgt: avoid dereferencing a potentially null info pointer
Message-Id: <20170323123900.GL27773@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323122230.19064-1-colin.king@canonical.com>
In-Reply-To: <20170323122230.19064-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

On Thu, Mar 23, 2017 at 12:22:30PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> info is being checked to see if it is a null pointer, however, vpgu is
> dereferencing info before this check, leading to a potential null
> pointer dereference.  If info is null, then the error message being
> printed by macro gvt_vgpu_err and this requires vpgu to exist. We can
> use a null vpgu as the macro has a sanity check to see if vpgu is null,
> so this is OK.

It is never NULL, it gets checked by its only caller.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
