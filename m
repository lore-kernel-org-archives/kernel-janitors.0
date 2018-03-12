From: Shawn Guo <shawnguo@kernel.org>
Date: Mon, 12 Mar 2018 07:35:26 +0000
Subject: Re: [PATCH] drm: zte: Fix an error handling path in 'zx_crtc_bind()'
Message-Id: <20180312073524.GM3217@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311223203.3669-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180311223203.3669-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Daniel Vetter <daniel.vetter@intel.com>
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

+ Daniel

On Sun, Mar 11, 2018 at 11:32:03PM +0100, Christophe JAILLET wrote:
> 'ret' is known to be 0 at this point. It must be updated by the value
> returned by 'clk_prepare_enable()'.
> 
> Fixes: 0a886f59528a ("drm: zte: add initial vou drm driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Shawn Guo <shawnguo@kernel.org>
