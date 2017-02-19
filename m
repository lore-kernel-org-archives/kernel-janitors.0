From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 19:27:12 +0000
Subject: [PATCH] sd: Fix error handling
Message-Id: <20170219192712.19807-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, hch@lst.de, dan.j.williams@intel.com, axboe@fb.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reorder 'out_free' and 'out_free_devt' error handling labels in order to
match the way resources have been allocated.


Fixes: 0dba1314d4f8 ("scsi, block: fix duplicate bdi name registration crashes")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index cb6e68dd6df0..99e12061a6fb 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3213,10 +3213,10 @@ static int sd_probe(struct device *dev)
 	sd_devt = NULL;
  out_put:
 	put_disk(gd);
- out_free:
-	kfree(sdkp);
  out_free_devt:
 	kfree(sd_devt);
+ out_free:
+	kfree(sdkp);
  out:
 	scsi_autopm_put_device(sdp);
 	return error;
-- 
2.9.3

