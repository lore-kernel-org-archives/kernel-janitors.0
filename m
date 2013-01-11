From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2013 06:52:44 +0000
Subject: [patch] dac960: return success instead of -ENOTTY
Message-Id: <20130111065244.GD13207@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Danny Kukawka <danny.kukawka@bisect.de>, Jesper Juhl <jj@chaosbits.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing break statement here.  This used to return directly
but we re-worked it in 2008 to add locking as part of the BKL push down.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/DAC960.c b/drivers/block/DAC960.c
index 9a13e88..0d3ffc5 100644
--- a/drivers/block/DAC960.c
+++ b/drivers/block/DAC960.c
@@ -7054,6 +7054,7 @@ static long DAC960_gam_ioctl(struct file *file, unsigned int Request,
 	else
 		ErrorCode =  0;
       }
+      break;
       default:
 	ErrorCode = -ENOTTY;
     }
