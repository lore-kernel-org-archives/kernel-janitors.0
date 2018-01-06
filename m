From: Colin King <colin.king@canonical.com>
Date: Sat, 06 Jan 2018 17:28:09 +0000
Subject: [PATCH] gpu: ipu-v3: make array 'int_reg' static, shrinks object size
Message-Id: <20180106172809.19913-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const read-only array 'int_reg' on the stack but instead
make it static. Makes the object code smaller by over 80 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  28024	   8936	    192	  37152	   9120	drivers/gpu/ipu-v3/ipu-common.o

After:
   text	   data	    bss	    dec	    hex	filename
  27794	   9080	    192	  37066	   90ca	drivers/gpu/ipu-v3/ipu-common.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/ipu-v3/ipu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 658fa2d3e40c..babf1aee7ca5 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1089,7 +1089,7 @@ static void ipu_irq_handler(struct irq_desc *desc)
 {
 	struct ipu_soc *ipu = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	const int int_reg[] = { 0, 1, 2, 3, 10, 11, 12, 13, 14};
+	static const int int_reg[] = { 0, 1, 2, 3, 10, 11, 12, 13, 14};
 
 	chained_irq_enter(chip, desc);
 
-- 
2.15.1

