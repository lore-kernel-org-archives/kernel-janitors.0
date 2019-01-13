From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Jan 2019 09:44:48 +0000
Subject: [PATCH 0/3] add missing of_node_put
Message-Id: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org

The result of of_graph_get_remote_port_parent needs an of_node_put,
even if it is not available.

---

 drivers/gpu/drm/meson/meson_drv.c     |    9 +++++++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c |    1 +
 drivers/of/property.c                 |    1 +
 3 files changed, 9 insertions(+), 2 deletions(-)
