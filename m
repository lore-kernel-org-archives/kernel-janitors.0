From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 10:08:33 +0000
Subject: [next:akpm 140/423] fs/block_dev.c:135:2: error: implicit declaration of function 'prio_tree_empty'
Message-Id: <20120928100833.GB29414@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Michel,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   b97e42d4aec6640aeb2a0347d9d40d12db17ded9
commit: f7d8d6b34e1d98650967ef035824beabec51019d [140/423] mm: replace vma prio_tree with an interval tree
config: x86_64-allmodconfig

All error/warnings:

fs/block_dev.c: In function 'set_blocksize':
fs/block_dev.c:135:2: error: implicit declaration of function 'prio_tree_empty' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +135 fs/block_dev.c

b87570f5 (Mikulas Patocka 2012-09-26  129) 	/* Prevent starting I/O or mapping the device */
62ac665f (Mikulas Patocka 2012-09-26  130) 	percpu_down_write(&bdev->bd_block_size_semaphore);
b87570f5 (Mikulas Patocka 2012-09-26  131) 
b87570f5 (Mikulas Patocka 2012-09-26  132) 	/* Check that the block device is not memory mapped */
b87570f5 (Mikulas Patocka 2012-09-26  133) 	mapping = bdev->bd_inode->i_mapping;
b87570f5 (Mikulas Patocka 2012-09-26  134) 	mutex_lock(&mapping->i_mmap_mutex);
b87570f5 (Mikulas Patocka 2012-09-26 @135) 	if (!prio_tree_empty(&mapping->i_mmap) ||
b87570f5 (Mikulas Patocka 2012-09-26  136) 	    !list_empty(&mapping->i_mmap_nonlinear)) {
b87570f5 (Mikulas Patocka 2012-09-26  137) 		mutex_unlock(&mapping->i_mmap_mutex);
62ac665f (Mikulas Patocka 2012-09-26  138) 		percpu_up_write(&bdev->bd_block_size_semaphore);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
