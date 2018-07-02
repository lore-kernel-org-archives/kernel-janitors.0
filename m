From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 07:37:21 +0000
Subject: [PATCH] atm: zatm: remove redundant pointer zatm_dev
Message-Id: <20180702073721.10272-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer zatm_dev is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'zatm_dev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/zatm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/atm/zatm.c b/drivers/atm/zatm.c
index 2c288d1f42bb..e89146ddede6 100644
--- a/drivers/atm/zatm.c
+++ b/drivers/atm/zatm.c
@@ -1385,14 +1385,12 @@ static void zatm_close(struct atm_vcc *vcc)
 
 static int zatm_open(struct atm_vcc *vcc)
 {
-	struct zatm_dev *zatm_dev;
 	struct zatm_vcc *zatm_vcc;
 	short vpi = vcc->vpi;
 	int vci = vcc->vci;
 	int error;
 
 	DPRINTK(">zatm_open\n");
-	zatm_dev = ZATM_DEV(vcc->dev);
 	if (!test_bit(ATM_VF_PARTIAL,&vcc->flags))
 		vcc->dev_data = NULL;
 	if (vci != ATM_VPI_UNSPEC && vpi != ATM_VCI_UNSPEC)
-- 
2.17.1

