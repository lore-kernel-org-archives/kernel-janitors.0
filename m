From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 07 Oct 2019 07:44:23 +0000
Subject: Re: drm/imx: Checking a kmemdup() call in imx_pd_bind()
Message-Id: <1b86ce88-ec28-0710-b624-e1eded248da2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
In-Reply-To: <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Cc: kernel@pengutronix.de, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, Navid Emamdoost <navid.emamdoost@gmail.com>

> I agree with you, kmemdup may fail so a null check seems necessary there.

Would this place (and similar ones) be pointed out for further considerations
also by the source code analysis tool which your software research group
seems to be developing?
https://github.com/umnsec/cheq/

Regards,
Markus
