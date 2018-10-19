From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Oct 2018 09:19:09 +0000
Subject: [PATCH 3/3] scsi: myrs: prevent negatives in disable_enclosure_messages_store()
Message-Id: <20181019091909.a22ah7wybj6agqch@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We only want the value to be zero or one.

It's not a big deal, but say we passed set value to INT_MIN, then
disable_enclosure_messages_show() would return that 12 bytes of "buf"
are initialized but actually only 3 are.  I think there are tools like
KASAN which will trigger an info leak warning when that happens.

Fixes: 77266186397c ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/myrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
index 07e5a3f54e31..55842ed54231 100644
--- a/drivers/scsi/myrs.c
+++ b/drivers/scsi/myrs.c
@@ -1501,7 +1501,7 @@ static ssize_t disable_enclosure_messages_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (value > 2)
+	if (value < 0 || value > 2)
 		return -EINVAL;
 
 	cs->disable_enc_msg = value;
-- 
2.11.0
