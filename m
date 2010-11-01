From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 01 Nov 2010 10:30:13 +0000
Subject: Re: [PATCH] drm/i915: opregion_setup: iounmap correct address
Message-Id: <c6d829$pdch63@fmsmga001.fm.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288607542.3425.4.camel@lovely>
In-Reply-To: <1288607542.3425.4.camel@lovely>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors <kernel-janitors@vger.kernel.org>

On Mon, 01 Nov 2010 11:32:22 +0100, Christoph Fritz <chf.fritz@googlemail.com> wrote:
> In case of an opregion signature mismatch in intel_opregion_setup(),
> iounmap the correct address.

Applied to -fixes and tagged for stable.
Thanks!
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
