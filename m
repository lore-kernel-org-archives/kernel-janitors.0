From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 06 Oct 2019 09:33:21 +0000
Subject: Re: drm/imx: Checking a kmemdup() call in imx_pd_bind()
Message-Id: <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004190938.15353-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Cc: kernel-janitors@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen McCamant <smccaman@umn.edu>, Fabio Estevam <festevam@gmail.com>

I have taken another look also at the implementation of the function “imx_pd_bind”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/imx/parallel-display.c?id=43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135#n197
https://elixir.bootlin.com/linux/v5.4-rc1/source/drivers/gpu/drm/imx/parallel-display.c#L197

Now I find an unchecked call of the function “kmemdup” suspicious.
Will this detail trigger further software development considerations?

Regards,
Markus
