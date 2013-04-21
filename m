From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 21 Apr 2013 11:10:31 +0000
Subject: [patch] gru: info leak in gru_get_config_info()
Message-Id: <20130421111031.GE6171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitri Sivanich <sivanich@sgi.com>
Cc: Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "info.fill" array isn't initialized so it can leak uninitialized
stack information to user space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/sgi-gru/grufile.c b/drivers/misc/sgi-gru/grufile.c
index 44d273c..ed5fc43 100644
--- a/drivers/misc/sgi-gru/grufile.c
+++ b/drivers/misc/sgi-gru/grufile.c
@@ -176,6 +176,7 @@ static long gru_get_config_info(unsigned long arg)
 	info.nodes = num_online_nodes();
 	info.blades = info.nodes / nodesperblade;
 	info.chiplets = GRU_CHIPLETS_PER_BLADE * info.blades;
+	memset(&info.fill, 0, sizeof(info.fill));
 
 	if (copy_to_user((void __user *)arg, &info, sizeof(info)))
 		return -EFAULT;
