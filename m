From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:26:03 +0000
Subject: [patch] [media] av7110: fix confusing indenting
Message-Id: <20140328082603.GJ25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The else statement here is not aligned with the correct if statement.
I think the code works as intended and it's just the indenting which is
wrong.  Also kernel style says we should use curly braces here so I have
added those.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch doesn't change how the code works, but I would still
appreciate extra review because maybe the original code is wrong?

diff --git a/drivers/media/pci/ttpci/av7110_av.c b/drivers/media/pci/ttpci/av7110_av.c
index 301029c..9544cfc 100644
--- a/drivers/media/pci/ttpci/av7110_av.c
+++ b/drivers/media/pci/ttpci/av7110_av.c
@@ -958,8 +958,10 @@ static unsigned int dvb_video_poll(struct file *file, poll_table *wait)
 		if (av7110->playing) {
 			if (FREE_COND)
 				mask |= (POLLOUT | POLLWRNORM);
-			} else /* if not playing: may play if asked for */
-				mask |= (POLLOUT | POLLWRNORM);
+		} else {
+			/* if not playing: may play if asked for */
+			mask |= (POLLOUT | POLLWRNORM);
+		}
 	}
 
 	return mask;
