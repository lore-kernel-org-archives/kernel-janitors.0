From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 11:54:05 +0000
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
Message-Id: <f90d7b4a-c4af-eac1-f326-211e932dbd22@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <027fde47-86b3-35c8-85e6-ea7c191e772c@web.de>
In-Reply-To: <027fde47-86b3-35c8-85e6-ea7c191e772c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de
Cc: kernel-janitors@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen McCamant <smccaman@umn.edu>, Fabio Estevam <festevam@gmail.com>

> +free_edid:
> + 	kfree(imxpd->edid);
> + 	return ret;

I have taken another look at this change idea.
Can the function call “devm_kfree(dev, imxpd)” become relevant
also at this place?

Would you like to combine it with the update suggestion
“Fix error handling for a kmemdup() call in imx_pd_bind()”?
https://lore.kernel.org/r/3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de/
https://lore.kernel.org/patchwork/patch/1138912/
https://lkml.org/lkml/2019/10/12/87

Regards,
Markus
