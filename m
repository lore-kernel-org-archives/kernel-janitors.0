From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 27 Oct 2010 21:58:45 +0000
Subject: Re: [patch] i915: signedness bug in check_overlay_src()
Message-Id: <b9dded$gtljue@orsmga002.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027211724.GI6062@bicker>
In-Reply-To: <20101027211724.GI6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 27 Oct 2010 23:17:25 +0200, Dan Carpenter <error27@gmail.com> wrote:
> "depth" should be signed in case packed_depth_bytes() returns -EINVAL.
> 
> This probably doesn't make a difference at runtime.  In the original
> code we would return -EINVAL later if (rec->offset_Y % 4294967274) is
> non-zero.

Applied to fixes, thanks.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
