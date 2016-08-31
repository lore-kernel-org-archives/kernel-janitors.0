From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 31 Aug 2016 22:21:18 +0000
Subject: [PATCH 0/5] constify ethtool_ops structures
Message-Id: <1472682083-5219-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Constify ethtool_ops structures.

---

 drivers/net/ethernet/mediatek/mtk_eth_soc.c       |    2 +-
 drivers/net/ethernet/synopsys/dwc_eth_qos.c       |    2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |    2 +-
 drivers/net/usb/r8152.c                           |    2 +-
 drivers/staging/netlogic/xlr_net.c                |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
