From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Aug 2013 08:57:35 +0000
Subject: [patch] staging: comedi: dt282x: dt282x_ai_insn_read() always fails
Message-Id: <20130820085735.GB20170@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In dt282x_ai_insn_read() we call this macro like:
wait_for(!mux_busy(), comedi_error(dev, "timeout\n"); return -ETIME;);
Because the if statement doesn't have curly braces it means we always
return -ETIME and the function never succeeds.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This macro is very ugly, btw.

diff --git a/drivers/staging/comedi/drivers/dt282x.c b/drivers/staging/comedi/drivers/dt282x.c
index 23cb0335..4a25382 100644
--- a/drivers/staging/comedi/drivers/dt282x.c
+++ b/drivers/staging/comedi/drivers/dt282x.c
@@ -267,8 +267,9 @@ struct dt282x_private {
 			}					\
 			udelay(5);				\
 		}						\
-		if (_i)						\
+		if (_i) {					\
 			b					\
+		}						\
 	} while (0)
 
 static int prep_ai_dma(struct comedi_device *dev, int chan, int size);
