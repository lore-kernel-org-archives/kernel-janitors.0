From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 09:04:17 +0000
Subject: [PATCH 0/2] drm/imx: Adjustments for two functions
Message-Id: <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
In-Reply-To: <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, Peter Senna Tschudin <peter.senna@collabora.com>
Cc: Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen McCamant <smccaman@umn.edu>, Navid Emamdoost <emamd001@umn.edu>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Oct 2019 10:45:45 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Fix error handling for a kmemdup() call in imx_pd_bind()
  Fix error handling for a kmemdup() call in imx_ldb_panel_ddc()

 drivers/gpu/drm/imx/imx-ldb.c          | 2 ++
 drivers/gpu/drm/imx/parallel-display.c | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

--
2.23.0
