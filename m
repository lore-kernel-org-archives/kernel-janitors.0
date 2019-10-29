From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 29 Oct 2019 06:15:30 +0000
Subject: [PATCH -next] scsi: csiostor: Remove set but not used variable 'rln'
Message-Id: <20191029061530.98197-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/csiostor/csio_lnode.c: In function 'csio_ln_init':
drivers/scsi/csiostor/csio_lnode.c:1995:21: warning:
 variable 'rln' set but not used [-Wunused-but-set-variable]

It is never used since introduction, so remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/csiostor/csio_lnode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/csiostor/csio_lnode.c b/drivers/scsi/csiostor/csio_lnode.c
index 23cbe4cda760..74ff8adc41f7 100644
--- a/drivers/scsi/csiostor/csio_lnode.c
+++ b/drivers/scsi/csiostor/csio_lnode.c
@@ -1992,7 +1992,7 @@ static int
 csio_ln_init(struct csio_lnode *ln)
 {
 	int rv = -EINVAL;
-	struct csio_lnode *rln, *pln;
+	struct csio_lnode *pln;
 	struct csio_hw *hw = csio_lnode_to_hw(ln);
 
 	csio_init_state(&ln->sm, csio_lns_uninit);
@@ -2022,7 +2022,6 @@ csio_ln_init(struct csio_lnode *ln)
 		 * THe rest is common for non-root physical and NPIV lnodes.
 		 * Just get references to all other modules
 		 */
-		rln = csio_root_lnode(ln);
 
 		if (csio_is_npiv_ln(ln)) {
 			/* NPIV */
