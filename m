From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jul 2017 08:40:36 +0000
Subject: [PATCH 2/3] lib/test_kmod: take the lock in register_test_dev_kmod()
Message-Id: <20170707084036.f6jxmffxk67qtmce@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170707083933.2mgnpqafhspbwu7h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally just drop the lock twice instead of taking it and then
releasing it.

Fixes: 39258f448d71 ("kmod: add test driver to stress test the module loader")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index 8797400b8bda..093b44771197 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -1146,7 +1146,7 @@ static struct kmod_test_device *register_test_dev_kmod(void)
 	struct kmod_test_device *test_dev = NULL;
 	int ret;
 
-	mutex_unlock(&reg_dev_mutex);
+	mutex_lock(&reg_dev_mutex);
 
 	/* int should suffice for number of devices, test for wrap */
 	if (unlikely(num_test_devs + 1) < 0) {
