From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 22 Apr 2012 08:06:17 +0000
Subject: [patch] [media] fintek-cir: change || to &&
Message-Id: <20120422080617.GA1252@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4F90798B.5000709@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The current condition is always true, so everything uses
LOGICAL_DEV_CIR_REV2 (8).  It should be that Fintek products
0x0408(F71809) and 0x0804(F71855) use logical device
LOGICAL_DEV_CIR_REV1 (5) and other chip ids use logical device 8.

In other words, this fixes hardware detection for 0x0408 and 0x0804.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index 392d4be..fba611e 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -197,7 +197,7 @@ static int fintek_hw_detect(struct fintek_dev *fintek)
 	/*
 	 * Newer reviews of this chipset uses port 8 instead of 5
 	 */
-	if ((chip != 0x0408) || (chip != 0x0804))
+	if ((chip != 0x0408) && (chip != 0x0804))
 		fintek->logical_dev_cir = LOGICAL_DEV_CIR_REV2;
 	else
 		fintek->logical_dev_cir = LOGICAL_DEV_CIR_REV1;
