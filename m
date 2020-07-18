From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Jul 2020 07:02:46 +0000
Subject: [PATCH 2/2] misc: hpilo: avoid a useless memset
Message-Id: <20200718070246.338016-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/hpilo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/hpilo.c b/drivers/misc/hpilo.c
index c9539c89a925..fea3ae9d8686 100644
--- a/drivers/misc/hpilo.c
+++ b/drivers/misc/hpilo.c
@@ -281,8 +281,6 @@ static int ilo_ccb_setup(struct ilo_hwinfo *hw, struct ccb_data *data, int slot)
 	dma_va = (char *)data->dma_va;
 	dma_pa = data->dma_pa;
 
-	memset(dma_va, 0, data->dma_size);
-
 	dma_va = (char *)roundup((unsigned long)dma_va, ILO_START_ALIGN);
 	dma_pa = roundup(dma_pa, ILO_START_ALIGN);
 
-- 
2.25.1
