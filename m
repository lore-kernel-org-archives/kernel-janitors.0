From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Oct 2018 10:28:43 +0000
Subject: [PATCH] EDAC, thunderx: memory leak in thunderx_l2c_threaded_isr()
Message-Id: <20181013102843.GG16086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Daney <david.daney@cavium.com>, Sergey Temerkhanov <s.temerkhanov@gmail.com>
Cc: Jan Glauber <jglauber@cavium.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

I found this memory leak with static analysis, but it looks like it
might be pretty bad because it affects the success path.

Fixes: 41003396f932 ("EDAC, thunderx: Add Cavium ThunderX EDAC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It's also possible that I have misread the code.  It seems like an
obvious fix but I haven't tested it.

 drivers/edac/thunderx_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/thunderx_edac.c b/drivers/edac/thunderx_edac.c
index c009d94f40c5..34be60fe6892 100644
--- a/drivers/edac/thunderx_edac.c
+++ b/drivers/edac/thunderx_edac.c
@@ -1884,7 +1884,7 @@ static irqreturn_t thunderx_l2c_threaded_isr(int irq, void *irq_id)
 	default:
 		dev_err(&l2c->pdev->dev, "Unsupported device: %04x\n",
 			l2c->pdev->device);
-		return IRQ_NONE;
+		goto err_free;
 	}
 
 	while (CIRC_CNT(l2c->ring_head, l2c->ring_tail,
@@ -1906,7 +1906,7 @@ static irqreturn_t thunderx_l2c_threaded_isr(int irq, void *irq_id)
 		l2c->ring_tail++;
 	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
 
 err_free:
 	kfree(other);
-- 
2.18.0
