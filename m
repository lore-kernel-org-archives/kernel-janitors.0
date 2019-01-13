From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Jan 2019 08:47:40 +0000
Subject: [PATCH 0/4] add missing of_node_puts
Message-Id: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rockchip@lists.infradead.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org

The device node iterators perform an of_node_get on each iteration, so a
jump out of the loop requires an of_node_put.

The patches for drivers/gpu/drm/imx/imx-ldb.c and
drivers/gpu/drm/sun4i/sun4i_backend.c contain some added of_node_puts for
which the need was identified manually.  Details are in the patch logs.

---

 drivers/gpu/drm/imx/imx-ldb.c           |   25 +++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    5 ++++-
 drivers/gpu/drm/rockchip/rockchip_rgb.c |    4 +++-
 drivers/gpu/drm/sun4i/sun4i_backend.c   |    1 +
 4 files changed, 25 insertions(+), 10 deletions(-)
