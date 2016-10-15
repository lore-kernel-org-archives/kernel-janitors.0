From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Oct 2016 17:32:00 +0000
Subject: [PATCH 0/2] constify i2c_adapter_quirks structures
Message-Id: <1476552722-12352-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Constify i2c_adapter_quirks structures.

---

 drivers/i2c/busses/i2c-axxia.c      |    2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c  |    2 +-
 drivers/i2c/busses/i2c-dln2.c       |    2 +-
 drivers/i2c/busses/i2c-viperboard.c |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
