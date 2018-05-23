From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 23 May 2018 19:07:11 +0000
Subject: [PATCH 0/5] add missing of_node_put
Message-Id: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444480254-14399-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444480254-14399-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pci@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

The device node iterators perform an of_node_get on each iteration, so a
jump out of the loop requires an of_node_put.

---

 drivers/gpu/drm/rockchip/rockchip_lvds.c   |    4 +++-
 drivers/pci/hotplug/pnv_php.c              |    8 ++++++--
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c |    9 +++++++--
 drivers/pinctrl/pinctrl-at91-pio4.c        |    4 +++-
 drivers/soc/ti/knav_dma.c                  |    1 +
 5 files changed, 20 insertions(+), 6 deletions(-)
