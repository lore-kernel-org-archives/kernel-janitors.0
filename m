From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 22:33:05 +0000
Subject: [PATCH 1/2] rapidio: Fix resources leak in error handling path in 'rio_dma_transfer()'
Message-Id: <61292a4f369229eee03394247385e955027283f8.1505687047.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mporter@kernel.crashing.org, alexandre.bounine@idt.com, lstoakes@gmail.com, akpm@linux-foundation.org, jesper.nilsson@axis.com, christian.koenig@amd.com, logang@deltatee.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dma_map_sg()', we should branch to the existing error handling path to
free some resources before returning.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 5beb0c361076..76afe1449cab 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -963,7 +963,8 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 			   req->sgt.sgl, req->sgt.nents, dir);
 	if (nents = -EFAULT) {
 		rmcd_error("Failed to map SG list");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_pg;
 	}
 
 	ret = do_dma_request(req, xfer, sync, nents);
-- 
2.11.0

