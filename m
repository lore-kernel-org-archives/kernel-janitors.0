From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:23:23 +0000
Subject: [patch] spi/spidev: handle integer wrap in spidev_message()
Message-Id: <20111018062323.GK27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"k_tmp->len" and "total" are unsigned integers.  The first message
could be close to "bufsiz" (4096) and then the next message could be
4GB which would cause an integer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I have not tested this.

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 830adbe..aab05e1 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -241,7 +241,7 @@ static int spidev_message(struct spidev_data *spidev,
 		k_tmp->len = u_tmp->len;
 
 		total += k_tmp->len;
-		if (total > bufsiz) {
+		if (total > bufsiz || total < k_tmp->len) {
 			status = -EMSGSIZE;
 			goto done;
 		}
