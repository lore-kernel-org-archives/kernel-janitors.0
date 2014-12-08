From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 08 Dec 2014 14:15:06 +0000
Subject: Re: [PATCH 7/20] drm/i915: fix misspelling of current function in string
Message-Id: <20141208141506.GQ20350@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417980062-25151-8-git-send-email-Julia.Lawall@lip6.fr>
 <87fvcqo2w4.fsf@intel.com>
In-Reply-To: <87fvcqo2w4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux@rasmusvillemoes.dk, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>, joe@perches.com, Daniel Vetter <daniel.vetter@intel.com>

On Mon, Dec 08, 2014 at 12:24:27PM +0200, Jani Nikula wrote:
> On Sun, 07 Dec 2014, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Replace a misspelled function name by %s and then __func__.
> >
> > This was done using Coccinelle, including the use of Levenshtein distance,
> > as proposed by Rasmus Villemoes.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > The semantic patch is difficult to summarize, but is available in the cover
> > letter of this patch series.
> >
> > The message is sort of ambiguous, but I assume that it is intended to refer
> > to the function in which the problem is detected.
> 
> Hmm, DRM_DEBUG prints __func__ too.

We've killed the pin ioctl for 3.20 hence didn't even bother to come up
with an opinion ;-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
