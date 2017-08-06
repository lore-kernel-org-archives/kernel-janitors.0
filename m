From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 06 Aug 2017 08:25:09 +0000
Subject: [PATCH 00/12] constify v4l2_m2m_ops structures
Message-Id: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The v4l2_m2m_ops structures are only passed as the only
argument to v4l2_m2m_init, which is declared as const.
Thus the v4l2_m2m_ops structures themselves can be const.

Done with the help of Coccinelle.

---

 drivers/media/platform/exynos-gsc/gsc-m2m.c     |    2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c    |    2 +-
 drivers/media/platform/m2m-deinterlace.c        |    2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c |    2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c    |    2 +-
 drivers/media/platform/mx2_emmaprp.c            |    2 +-
 drivers/media/platform/rcar_jpu.c               |    2 +-
 drivers/media/platform/s5p-g2d/g2d.c            |    2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c   |    2 +-
 drivers/media/platform/sti/delta/delta-v4l2.c   |    2 +-
 drivers/media/platform/ti-vpe/vpe.c             |    2 +-
 drivers/media/platform/vim2m.c                  |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)
