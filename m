From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jan 2018 10:27:54 +0000
Subject: [PATCH] lib/test_kmod: Fix an integer overflow test
Message-Id: <20180122102754.GD23912@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The main problem is that the parentheses are in the wrong place and the
unlikely() call returns either 0 or 1 so it's never less than zero.  The
other problem is that signed integer overflows like "INT_MAX + 1" are
undefined behavior.

Fixes: d9c6a72d6fa2 ("kmod: add test driver to stress test the module loader")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index e372b97eee13..30fd6d9e5361 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -1141,7 +1141,7 @@ static struct kmod_test_device *register_test_dev_kmod(void)
 	mutex_lock(&reg_dev_mutex);
 
 	/* int should suffice for number of devices, test for wrap */
-	if (unlikely(num_test_devs + 1) < 0) {
+	if (num_test_devs = INT_MAX) {
 		pr_err("reached limit of number of test devices\n");
 		goto out;
 	}
