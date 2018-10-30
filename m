From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 30 Oct 2018 08:57:56 +0000
Subject: Re: [PATCH 7/8] drm/imx: imx-tve: constify clk_ops structure
Message-Id: <1540889876.5088.0.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
         <1540619262-22681-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sat, 2018-10-27 at 07:47 +0200, Julia Lawall wrote:
> The clk_ops structure is only stored in the ops field of a
> clk_init_data structure.  This field is const, so the clk_ops
> structure can be const as well.
> 
> Identified and transformed using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thank you, applied to imx-drm/next.

regards
Philipp
