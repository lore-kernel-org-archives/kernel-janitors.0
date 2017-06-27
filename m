From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 27 Jun 2017 13:30:53 +0000
Subject: Re: [PATCH] drm/i915: Fix an error checking test
Message-Id: <149857025387.8075.5520164386688935875@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170627053854.21152-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170627053854.21152-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.vetter@intel.com, jani.nikula@linux.intel.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com, matthew.auld@intel.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Christophe JAILLET (2017-06-27 06:38:54)
> 'dma_buf_vmap' returns NULL on error, not an error pointer.
> 
> Fixes: 6cca22ede8a4 ("drm/i915: Add some mock tests for dmabuf interop")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for the fix, reviewed and pushed.
-Chris
