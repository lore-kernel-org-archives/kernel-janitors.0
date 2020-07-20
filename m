From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 20 Jul 2020 13:22:49 +0000
Subject: Re: [PATCH] drm/imx: imx-tve: Delete an error message in imx_tve_bind()
Message-Id: <74fe611ff6e12750b056d18703059787d475eaa1.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb87043b-1881-da68-ba28-35406b6594ed@web.de>
In-Reply-To: <eb87043b-1881-da68-ba28-35406b6594ed@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

On Sun, 2020-04-05 at 11:16 +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 11:01:49 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thank you, applied to imx-drm/next.

regards
Philipp
