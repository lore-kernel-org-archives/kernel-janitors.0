From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 06:42:27 +0000
Subject: [PATCH 1/2] i2o: fix overflow of copy_to_user()
Message-Id: <1279176147-5521-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org

If (len > reslen) we must not call copy_to_user() since kernel buffer is
smaller than we want to copy. Similar code in this file is correct, so
this bug was a typo.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/message/i2o/i2o_config.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/message/i2o/i2o_config.c b/drivers/message/i2o/i2o_config.c
index c4b117f..4dd39a0 100644
--- a/drivers/message/i2o/i2o_config.c
+++ b/drivers/message/i2o/i2o_config.c
@@ -115,7 +115,7 @@ static int i2o_cfg_gethrt(unsigned long arg)
 	put_user(len, kcmd.reslen);
 	if (len > reslen)
 		ret = -ENOBUFS;
-	if (copy_to_user(kcmd.resbuf, (void *)hrt, len))
+	else if (copy_to_user(kcmd.resbuf, (void *)hrt, len))
 		ret = -EFAULT;
 
 	return ret;
-- 
1.7.0.4

