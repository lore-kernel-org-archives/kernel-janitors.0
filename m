From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:48:10 +0000
Subject: [patch] hpani: using the wrong variable
Message-Id: <20100328114810.GS5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We're updating the "HpPriv->ani" array here so we should use that to
determine the end of the for loop.  "HpPriv->ani" has 50 elements and 
"wd->regulationTable.allowChannel" has 59 elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/otus/hal/hpani.c b/drivers/staging/otus/hal/hpani.c
index 0afecd8..d401504 100644
--- a/drivers/staging/otus/hal/hpani.c
+++ b/drivers/staging/otus/hal/hpani.c
@@ -96,7 +96,7 @@ void zfHpAniAttach(zdev_t* dev)
     HpPriv->hasHwPhyCounters = 1;
 
     memset((char *)&HpPriv->ani, 0, sizeof(HpPriv->ani));
-    for (i = 0; i < N(wd->regulationTable.allowChannel); i++)
+    for (i = 0; i < ARRAY_SIZE(HpPriv->ani); i++)
     {
         /* New ANI stuff */
         HpPriv->ani[i].ofdmTrigHigh = ZM_HAL_ANI_OFDM_TRIG_HIGH;
