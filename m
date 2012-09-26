From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 07:42:36 +0000
Subject: [block:for-3.7/core 20/21] fs/block_dev.c:1644:5: sparse: symbol 'blkdev_mmap' was not declared. Sho
Message-Id: <20120926074236.GB26028@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.dk/linux-block.git for-3.7/core
head:   62ac665ff9fc07497ca524bd20d6a96893d11071
commit: b87570f5d349661814b262dd5fc40787700f80d6 [20/21] Fix a crash when block device is read and block size is changed at the same time

+ fs/block_dev.c:1644:5: sparse: symbol 'blkdev_mmap' was not declared. Should it be static?

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--jRHKVT23PllUwdXP
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-b87570f.diff"

diff --git a/fs/block_dev.c b/fs/block_dev.c
index cdfb625..5aa4683 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1641,7 +1641,7 @@ ssize_t blkdev_aio_write(struct kiocb *iocb, const struct iovec *iov,
 }
 EXPORT_SYMBOL_GPL(blkdev_aio_write);
 
-int blkdev_mmap(struct file *file, struct vm_area_struct *vma)
+static int blkdev_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	int ret;
 	struct block_device *bdev = I_BDEV(file->f_mapping->host);

--jRHKVT23PllUwdXP--
