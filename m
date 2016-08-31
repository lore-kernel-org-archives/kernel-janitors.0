From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 31 Aug 2016 07:30:42 +0000
Subject: [PATCH 0/6] constify ethtool_ops structures
Message-Id: <1472628648-3603-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Constify ethtool_ops structures.

---

 drivers/net/ethernet/agere/et131x.c              |    2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c       |    2 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c   |    2 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c       |    2 +-
 drivers/net/ethernet/hisilicon/hisi_femac.c      |    2 +-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c    |    2 +-
 drivers/net/ethernet/hisilicon/hns/hns_ethtool.c |    2 +-
 drivers/net/ethernet/synopsys/dwc_eth_qos.c      |    2 +-
 drivers/staging/slicoss/slicoss.c                |    4 ++--
 9 files changed, 10 insertions(+), 10 deletions(-)
