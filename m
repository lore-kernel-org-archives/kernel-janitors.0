From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:46:10 +0000
Subject: [PATCH 26] drivers/scsi/gdth.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311946.10699.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-scsi@vger.kernel.org, achim_leubner@adaptec.com, boji.t.kannanthanam@intel.com, johannes_dinner@adaptec.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/scsi/gdth.c | 189401 -> 189342 (-59 bytes)
 drivers/scsi/gdth.o | 331028 -> 330324 (-704 bytes)

 drivers/scsi/gdth.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/scsi/gdth.c	2007-07-26 13:07:42.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/scsi/gdth.c	2007-07-31 14:08:37.000000000 +0200
@@ -458,10 +458,10 @@ int __gdth_execute(struct scsi_device *s
     DECLARE_COMPLETION_ONSTACK(wait);
     int rval;

-    scp = kmalloc(sizeof(*scp), GFP_KERNEL);
+    scp = kzalloc(sizeof(*scp), GFP_KERNEL);
     if (!scp)
         return -ENOMEM;
-    memset(scp, 0, sizeof(*scp));
+
     scp->device = sdev;
     /* use request field to save the ptr. to completion struct. */
     scp->request = (struct request *)&wait;
@@ -5273,10 +5273,10 @@ static int gdth_ioctl(struct inode *inod
         hanum = res.ionode;
         ha = gdth_find_ha(hanum);

-        scp  = kmalloc(sizeof(*scp), GFP_KERNEL);
+        scp = kzalloc(sizeof(*scp), GFP_KERNEL);
         if (!scp)
             return -ENOMEM;
-        memset(scp, 0, sizeof(*scp));
+
         scp->device = ha->sdev;
         scp->cmd_len = 12;
         scp->use_sg = 0;
