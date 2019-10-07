From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 07 Oct 2019 04:26:12 +0000
Subject: Re: drm/imx: Checking a kmemdup() call in imx_pd_bind()
Message-Id: <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
In-Reply-To: <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Navid Emamdoost <emamd001@umn.edu>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen McCamant <smccaman@umn.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org

Hi Markus,

I agree with you, kmemdup may fail so a null check seems necessary there.

On Sun, Oct 6, 2019 at 4:33 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> I have taken another look also at the implementation of the function “imx_pd_bind”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/imx/parallel-display.c?id=43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135#n197
> https://elixir.bootlin.com/linux/v5.4-rc1/source/drivers/gpu/drm/imx/parallel-display.c#L197
>
> Now I find an unchecked call of the function “kmemdup” suspicious.
> Will this detail trigger further software development considerations?
>
> Regards,
> Markus



-- 
Navid.
