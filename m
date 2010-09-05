From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:33 +0000
Subject: [PATCH 05/14] staging: comedi: check return code of put_user
Message-Id: <1283711554-7287-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Ian Abbott <abbotti@mev.co.uk>, Shawn Bohrer <shawn.bohrer@gmail.com>, Mark Rankilor <reodge@gmail.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

Function put_user may fail. Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I couldn't compile this driver at all, so it is not tested.

 drivers/staging/comedi/comedi_fops.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index 1409131..a3c7183 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -537,7 +537,8 @@ static int do_chaninfo_ioctl(struct comedi_device *dev,
 
 			x = (dev->minor << 28) | (it.subdev << 24) | (i << 16) |
 			    (s->range_table_list[i]->length);
-			put_user(x, it.rangelist + i);
+			if (put_user(x, it.rangelist + i))
+				return -EFAULT;
 		}
 #if 0
 		if (copy_to_user(it.rangelist, s->range_type_list,
-- 
1.7.0.4

