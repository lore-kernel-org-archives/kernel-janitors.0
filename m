From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 17 Jan 2019 14:00:38 +0000
Subject: Re: [PATCH 2/4] drm/imx: imx-ldb: add missing of_node_puts
Message-Id: <1547733638.4009.11.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
         <1547369264-24831-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547369264-24831-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sun, 2019-01-13 at 09:47 +0100, Julia Lawall wrote:
> The device node iterators perform an of_node_get on each
> iteration, so a jump out of the loop requires an of_node_put.
> 
> Move the initialization channel->child = child; down to just
> before the call to imx_ldb_register so that intervening failures
> don't need to clear it.  Add a label at the end of the function to
> do all the of_node_puts.

Thank you, I've applied the patch to the imx-drm/fixes branch.

regards
Philipp
