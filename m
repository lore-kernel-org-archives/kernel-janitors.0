From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 13:01:34 +0000
Subject: [PATCH] scsi_cmnd.h: remove double inclusion of linux/blkdev.h
Message-Id: <a4423d670807060601sa56948ak812c4569297fada6@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, bharrosh@panasas.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

Remove double inclusion of linux/blkdev.h

 include/scsi/scsi_cmnd.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
index 3e46dfa..66c9448 100644
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@ -7,7 +7,6 @@
 #include <linux/types.h>
 #include <linux/timer.h>
 #include <linux/scatterlist.h>
-#include <linux/blkdev.h>

 struct Scsi_Host;
 struct scsi_device;
