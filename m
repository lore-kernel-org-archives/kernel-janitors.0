From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 15 Sep 2016 20:23:23 +0000
Subject: [PATCH 0/3] constify net_device_ops structures
Message-Id: <1473971006-2074-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Constify net_device_ops structures.

---

 drivers/net/ethernet/hisilicon/hip04_eth.c  |    2 +-
 drivers/net/ethernet/synopsys/dwc_eth_qos.c |    2 +-
 net/l2tp/l2tp_eth.c                         |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
