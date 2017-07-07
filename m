From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jul 2017 08:39:33 +0000
Subject: [PATCH 1/3] lib/test_kmod: tidy up bounds checking
Message-Id: <20170707083933.2mgnpqafhspbwu7h@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is technically a bug where we don't test for negatives in
test_dev_config_update_uint_sync().  "new" is long and UINT_MAX is
unsigned int so on 64 bit systems negatives are allowed.

In the next test I removed the UINT_MAX comparison because "max" is
already an unsigned int so we already know that "new" can't be larger
than UINT_MAX.

On the third test, I just flipped the tests around so we consistently
test the lower bound before the upper bound.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index 6c1d678bcf8b..8797400b8bda 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -887,7 +887,7 @@ static int test_dev_config_update_uint_sync(struct kmod_test_device *test_dev,
 	if (ret)
 		return ret;
 
-	if (new > UINT_MAX)
+	if (new < 0 || new > UINT_MAX)
 		return -EINVAL;
 
 	mutex_lock(&test_dev->config_mutex);
@@ -924,7 +924,7 @@ static int test_dev_config_update_uint_range(struct kmod_test_device *test_dev,
 	if (ret)
 		return ret;
 
-	if (new < min || new >  max || new > UINT_MAX)
+	if (new < min || new > max)
 		return -EINVAL;
 
 	mutex_lock(&test_dev->config_mutex);
@@ -946,7 +946,7 @@ static int test_dev_config_update_int(struct kmod_test_device *test_dev,
 	if (ret)
 		return ret;
 
-	if (new > INT_MAX || new < INT_MIN)
+	if (new < INT_MIN || new > INT_MAX)
 		return -EINVAL;
 
 	mutex_lock(&test_dev->config_mutex);
