From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Oct 2018 09:18:19 +0000
Subject: [PATCH 2/3] scsi: myrs: Fix the processor absent message in processor_show()
Message-Id: <20181019091819.7q5t2ry67ksoyrgh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If both processors are absent then it's supposed to print that, but
instead we print that just the second processor is absent.

Fixes: 77266186397c ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/myrs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
index b02ee0b0dd55..07e5a3f54e31 100644
--- a/drivers/scsi/myrs.c
+++ b/drivers/scsi/myrs.c
@@ -1366,11 +1366,11 @@ static ssize_t processor_show(struct device *dev,
 			       first_processor, info->cpu[0].cpu_count,
 			       info->cpu[1].cpu_name,
 			       second_processor, info->cpu[1].cpu_count);
-	else if (!second_processor)
+	else if (first_processor && !second_processor)
 		ret = snprintf(buf, 64, "1: %s (%s, %d cpus)\n2: absent\n",
 			       info->cpu[0].cpu_name,
 			       first_processor, info->cpu[0].cpu_count);
-	else if (!first_processor)
+	else if (!first_processor && second_processor)
 		ret = snprintf(buf, 64, "1: absent\n2: %s (%s, %d cpus)\n",
 			       info->cpu[1].cpu_name,
 			       second_processor, info->cpu[1].cpu_count);
-- 
2.11.0
