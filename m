From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 04 Jul 2019 09:52:57 +0000
Subject: [PATCH -next] bcache: fix possible memory leak in bch_cached_dev_run()
Message-Id: <20190704095257.143492-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

memory malloced in bch_cached_dev_run() and should be freed before
leaving from the error handling cases, otherwise it will cause
memory leak.

Fixes: 0b13efecf5f2 ("bcache: add return value check to bch_cached_dev_run()")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/md/bcache/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 26e374fbf57c..20ed838e9413 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -931,6 +931,9 @@ int bch_cached_dev_run(struct cached_dev *dc)
 	if (dc->io_disable) {
 		pr_err("I/O disabled on cached dev %s",
 		       dc->backing_dev_name);
+		kfree(env[1]);
+		kfree(env[2]);
+		kfree(buf);
 		return -EIO;
 	}
