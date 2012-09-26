From: Mikulas Patocka <mpatocka@redhat.com>
Date: Wed, 26 Sep 2012 15:10:15 +0000
Subject: [PATCH] percpu-rw-semaphore: fix typos
Message-Id: <Pine.LNX.4.64.1209261107180.5897@file.rdu.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Wed, 26 Sep 2012, Jens Axboe wrote:

> On 2012-09-26 09:42, Fengguang Wu wrote:
> > Hi Jens,
> > 
> > FYI, there are new sparse warnings show up in
> > 
> > tree:   git://git.kernel.dk/linux-block.git for-3.7/core
> > head:   62ac665ff9fc07497ca524bd20d6a96893d11071
> > commit: b87570f5d349661814b262dd5fc40787700f80d6 [20/21] Fix a crash when block device is read and block size is changed at the same time
> > 
> > + fs/block_dev.c:1644:5: sparse: symbol 'blkdev_mmap' was not declared. Should it be static?
> > 
> > Please consider folding the attached diff :-)
> 
> Thanks Wu, you are (as usual) exceptionally fast :-)
> 
> Patch applied.
> 
> -- 
> Jens Axboe

One more patch for this thing, fixing some typos in the documentation.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 Documentation/percpu-rw-semaphore.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6-copy/Documentation/percpu-rw-semaphore.txt
=================================--- linux-2.6-copy.orig/Documentation/percpu-rw-semaphore.txt	2012-09-26 17:06:05.000000000 +0200
+++ linux-2.6-copy/Documentation/percpu-rw-semaphore.txt	2012-09-26 17:06:32.000000000 +0200
@@ -9,10 +9,10 @@ cores take the lock for reading, the cac
 is bouncing between L1 caches of the cores, causing performance
 degradation.
 
-Locking for reading it very fast, it uses RCU and it avoids any atomic
+Locking for reading is very fast, it uses RCU and it avoids any atomic
 instruction in the lock and unlock path. On the other hand, locking for
 writing is very expensive, it calls synchronize_rcu() that can take
-hundreds of microseconds.
+hundreds of milliseconds.
 
 The lock is declared with "struct percpu_rw_semaphore" type.
 The lock is initialized percpu_init_rwsem, it returns 0 on success and
