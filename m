From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:22:51 +0000
Subject: [patch] IB/hfi1: fix a locking bug
Message-Id: <20150916062251.GD21542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath@intel.com>
Cc: devel@driverdev.osuosl.org, linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

mutex_trylock() returns zero on failure, not EBUSY.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rdma/hfi1/chip.c b/drivers/staging/rdma/hfi1/chip.c
index 654eafe..aa58e59 100644
--- a/drivers/staging/rdma/hfi1/chip.c
+++ b/drivers/staging/rdma/hfi1/chip.c
@@ -2710,7 +2710,7 @@ int acquire_lcb_access(struct hfi1_devdata *dd, int sleep_ok)
 	if (sleep_ok) {
 		mutex_lock(&ppd->hls_lock);
 	} else {
-		while (mutex_trylock(&ppd->hls_lock) = EBUSY)
+		while (!mutex_trylock(&ppd->hls_lock))
 			udelay(1);
 	}
 
@@ -2758,7 +2758,7 @@ int release_lcb_access(struct hfi1_devdata *dd, int sleep_ok)
 	if (sleep_ok) {
 		mutex_lock(&dd->pport->hls_lock);
 	} else {
-		while (mutex_trylock(&dd->pport->hls_lock) = EBUSY)
+		while (!mutex_trylock(&dd->pport->hls_lock))
 			udelay(1);
 	}
 
