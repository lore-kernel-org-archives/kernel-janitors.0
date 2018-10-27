From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:34 +0000
Subject: [PATCH 0/8] constify clk_ops structure
Message-Id: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Declare as const clk_ops structures that are only stored in const fields or
passed to functions with const parameters.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

 arch/arm/mach-vexpress/spc.c             |    2 +-
 drivers/clk/clk-max77686.c               |    2 +-
 drivers/clk/clk-palmas.c                 |    2 +-
 drivers/clk/clk-s2mps11.c                |    2 +-
 drivers/clk/pistachio/clk-pll.c          |    8 ++++----
 drivers/clk/pxa/clk-pxa.c                |    4 ++--
 drivers/gpu/drm/imx/imx-tve.c            |    2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c |    2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)
