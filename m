From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 16:45:22 +0000
Subject: [PATCH] scsi: ips: make array 'options' static const, makes object smaller
Message-Id: <20190906164522.5644-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'options' on the stack but instead make it
static const. Makes the object code smaller by 143 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  94483	  11272	   1184	 106939	  1a1bb	drivers/scsi/ips.o

After:
   text	   data	    bss	    dec	    hex	filename
  94244	  11368	   1184	 106796	  1a12c	drivers/scsi/ips.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/ips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ips.c b/drivers/scsi/ips.c
index e8bc8d328bab..f25672982c5f 100644
--- a/drivers/scsi/ips.c
+++ b/drivers/scsi/ips.c
@@ -498,7 +498,7 @@ ips_setup(char *ips_str)
 	int i;
 	char *key;
 	char *value;
-	IPS_OPTION options[] = {
+	static const IPS_OPTION options[] = {
 		{"noi2o", &ips_force_i2o, 0},
 		{"nommap", &ips_force_memio, 0},
 		{"ioctlsize", &ips_ioctlsize, IPS_IOCTL_SIZE},
-- 
2.20.1
