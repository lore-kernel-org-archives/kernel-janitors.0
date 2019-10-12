From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 12 Oct 2019 19:22:18 +0000
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
Message-Id: <CAEkB2EQUrHpfCXDQ9HV9_hw7Ke5DmX3SvKWJd+wSwXB1Uqaf5g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <027fde47-86b3-35c8-85e6-ea7c191e772c@web.de> <f90d7b4a-c4af-eac1-f326-211e932dbd22@web.de>
In-Reply-To: <f90d7b4a-c4af-eac1-f326-211e932dbd22@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

No, that is not correct! You should not try to free imxpd here as it
is a resource-managed allocation via devm_kzalloc(). It means memory
allocated with this function is automatically freed on driver detach.
So, this patch introduces a double-free.

On Sat, Oct 12, 2019 at 6:54 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > +free_edid:
> > +     kfree(imxpd->edid);
> > +     return ret;
>
> I have taken another look at this change idea.
> Can the function call “devm_kfree(dev, imxpd)” become relevant
> also at this place?
>
> Would you like to combine it with the update suggestion
> “Fix error handling for a kmemdup() call in imx_pd_bind()”?
> https://lore.kernel.org/r/3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de/
> https://lore.kernel.org/patchwork/patch/1138912/
> https://lkml.org/lkml/2019/10/12/87
>
> Regards,
> Markus



-- 
Navid.
