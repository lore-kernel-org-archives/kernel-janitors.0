From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:28:04 +0000
Subject: [patch] staging: comedi: pcl812: missing break statement
Message-Id: <20130821082804.GC5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that there is a missing break statement here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This looks correct to me, but please double check.

diff --git a/drivers/staging/comedi/drivers/pcl812.c b/drivers/staging/comedi/drivers/pcl812.c
index 35251e7..03a0989 100644
--- a/drivers/staging/comedi/drivers/pcl812.c
+++ b/drivers/staging/comedi/drivers/pcl812.c
@@ -1404,6 +1404,7 @@ no_dma:
 		if (it->options[3] > 0)
 						/*  we use external trigger */
 			devpriv->use_ext_trg = 1;
+		break;
 	case boardA821:
 		devpriv->max_812_ai_mode0_rangewait = 1;
 		devpriv->mode_reg_int = (irq << 4) & 0xf0;
