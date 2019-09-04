From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Sep 2019 14:18:09 +0000
Subject: [PATCH] crypto: cavium/zip - Add missing single_release()
Message-Id: <20190904141809.170277-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Glauber <jglauber@cavium.com>, Mahipal Challa <mahipalreddy2006@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

When using single_open() for opening, single_release() should be
used instead of seq_release(), otherwise there is a memory leak.

Fixes: 09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/cavium/zip/zip_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/cavium/zip/zip_main.c b/drivers/crypto/cavium/zip/zip_main.c
index a8447a3cf366..194624b4855b 100644
--- a/drivers/crypto/cavium/zip/zip_main.c
+++ b/drivers/crypto/cavium/zip/zip_main.c
@@ -593,6 +593,7 @@ static const struct file_operations zip_stats_fops = {
 	.owner = THIS_MODULE,
 	.open  = zip_stats_open,
 	.read  = seq_read,
+	.release = single_release,
 };
 
 static int zip_clear_open(struct inode *inode, struct file *file)
@@ -604,6 +605,7 @@ static const struct file_operations zip_clear_fops = {
 	.owner = THIS_MODULE,
 	.open  = zip_clear_open,
 	.read  = seq_read,
+	.release = single_release,
 };
 
 static int zip_regs_open(struct inode *inode, struct file *file)
@@ -615,6 +617,7 @@ static const struct file_operations zip_regs_fops = {
 	.owner = THIS_MODULE,
 	.open  = zip_regs_open,
 	.read  = seq_read,
+	.release = single_release,
 };
 
 /* Root directory for thunderx_zip debugfs entry */
