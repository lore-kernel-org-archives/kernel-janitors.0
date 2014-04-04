From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Fri, 04 Apr 2014 15:44:44 +0000
Subject: [PATCH v2] staging: comedi: drivers: pcl812.c: add curly braces for checkpatch
Message-Id: <1396626284-15457-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: hsweeten@visionengravers.com, dan.carpenter@oracle.com, wharms@bfs.de, joe@perches.com, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Kernel style is that if one side of the if else statement gets has curly
braces then both side should have them.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/comedi/drivers/pcl812.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/pcl812.c b/drivers/staging/comedi/drivers/pcl812.c
index 160eac8..5cc01fe 100644
--- a/drivers/staging/comedi/drivers/pcl812.c
+++ b/drivers/staging/comedi/drivers/pcl812.c
@@ -811,8 +811,9 @@ static int pcl812_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 				devpriv->ai_dma = 0;
 				break;
 			}
-	} else
+	} else {
 		devpriv->ai_dma = 0;
+	}
 
 	devpriv->ai_act_scan = 0;
 	devpriv->ai_poll_ptr = 0;
-- 
1.9.0

