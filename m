From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 11:02:52 +0000
Subject: [PATCH] scsi: sym53c8xx_2: fix sizeof mismatch
Message-Id: <20201006110252.536641-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof is being used, struct sym_ccb ** is not correct,
it should be struct sym_ccb *. Note that since ** is the same size as
* this is not causing any issues.  Improve this fix by using the
idiom sizeof(*np->ccbh) as this allows one to not even reference the
type of the pointer.

[ Note: this is an ancient 2005 buglet, the sha is from the
  tglx/history repo ]

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 473c67f96e06 ("[PATCH] sym2 version 2.2.0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/sym53c8xx_2/sym_hipd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/sym53c8xx_2/sym_hipd.c b/drivers/scsi/sym53c8xx_2/sym_hipd.c
index cc11daa1222b..14118dd70711 100644
--- a/drivers/scsi/sym53c8xx_2/sym_hipd.c
+++ b/drivers/scsi/sym53c8xx_2/sym_hipd.c
@@ -5656,7 +5656,7 @@ int sym_hcb_attach(struct Scsi_Host *shost, struct sym_fw *fw, struct sym_nvram
 	/*
 	 *  Allocate the array of lists of CCBs hashed by DSA.
 	 */
-	np->ccbh = kcalloc(CCB_HASH_SIZE, sizeof(struct sym_ccb **), GFP_KERNEL);
+	np->ccbh = kcalloc(CCB_HASH_SIZE, sizeof(*np->ccbh), GFP_KERNEL);
 	if (!np->ccbh)
 		goto attach_failed;
 
-- 
2.27.0
