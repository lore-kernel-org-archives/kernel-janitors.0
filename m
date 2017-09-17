From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 22:33:06 +0000
Subject: [PATCH 2/2] rapidio: Fix an error handling in 'rio_dma_transfer()'
Message-Id: <d4235bd2b9274e99f6c86ea71b1fa1c7bd8d0c08.1505687047.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mporter@kernel.crashing.org, alexandre.bounine@idt.com, lstoakes@gmail.com, akpm@linux-foundation.org, jesper.nilsson@axis.com, christian.koenig@amd.com, logang@deltatee.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, 'dma_map_sg()' returns 0, not a negative value.
There is BUG_ON() in 'dma_map_sg_attrs()'  which makes sure of that.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 76afe1449cab..3dd37e35cf4e 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -961,7 +961,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 
 	nents = dma_map_sg(chan->device->dev,
 			   req->sgt.sgl, req->sgt.nents, dir);
-	if (nents = -EFAULT) {
+	if (nents = 0) {
 		rmcd_error("Failed to map SG list");
 		ret = -EFAULT;
 		goto err_pg;
-- 
2.11.0

