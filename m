From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 02 Oct 2010 14:07:54 +0000
Subject: Re: [PATCH 3/4] drivers/gpu/drm/i915/i915_gem.c: Add missing error handling code
Message-Id: <8u3s94$gm2ivf@orsmga002.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286027958-7333-3-git-send-email-julia@diku.dk>
In-Reply-To: <1286027958-7333-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sat,  2 Oct 2010 15:59:17 +0200, Julia Lawall <julia@diku.dk> wrote:
> Extend the error handling code with operations found in other nearby error
> handling code

Thanks, your fix was correct. Applied.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
