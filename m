From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 12 Jun 2013 14:33:15 +0000
Subject: [PATCH] staging: tidspbridge: Fix potential NULL pointer dereference
Message-Id: <1371047595-11702-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omar.ramirez@copitl.com, gregkh@linuxfoundation.org, justinmattock@gmail.com, andriy.shevchenko@linux.intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

We free dcd_key on line 897 and then dereference it a few lines below.
This patch adds a NULL check to make sure we can use dcd_key.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/tidspbridge/rmgr/dbdcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/tidspbridge/rmgr/dbdcd.c b/drivers/staging/tidspbridge/rmgr/dbdcd.c
index 3d2a26f..21ce3b7 100644
--- a/drivers/staging/tidspbridge/rmgr/dbdcd.c
+++ b/drivers/staging/tidspbridge/rmgr/dbdcd.c
@@ -899,7 +899,7 @@ int dcd_register_object(struct dsp_uuid *uuid_obj,
 			}
 		}
 		spin_unlock(&dbdcd_lock);
-		if (&dcd_key->link = &reg_key_list)
+		if (dcd_key && (&dcd_key->link = &reg_key_list))
 			status = -EPERM;
 	}
 
-- 
1.7.10.4

