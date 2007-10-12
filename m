From: "Little, Chris" <Chris.Little@okdhs.org>
Date: Fri, 12 Oct 2007 17:18:23 +0000
Subject: removing lock_kernel() from fs/fat
Message-Id: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Background:
Not much.  Some C. Have been using Linux since pre-1.0 and s390 Linux
admin for the last seven years or so.  I've been following kernel
janitors and lkml (lkml when i can) for awhile now.  Also reading "Linux
Kernel Development" by Robert Love.

Now:
Saw in the janitor list about removing lock_kernel().  Created the
following patch for linux/fs/fat against vanilla 2.6.23, but I have some
questions.

1.  In file.c, line 304:
	lock_kernel();
	fat_free(inode, nr_clusters);
	unlock_kernel();

	Why wrap fat_free with lock_kernel and not lock in the function
itself?

2.  In inode.c, starting at lines 439 and 570, the two functions
fat_clear_inode() and fat_write_inode() lock_kernel and then spin lock.
Why the spin lock if it already has the bkl?  Since the spin locks are
used, it makes me less sure of this.  I didn't touch lock_kernel() in
inode.c at all.  In fact I'm almost positive I'm missing something, but
I'm here to learn.  So here it is:

--- linux-2.6.23/fs/fat/dir.c   2007-10-09 15:31:38.000000000 -0500
+++ linux-2.6.23-jcl/fs/fat/dir.c     2007-10-12 11:02:17.000000000
-0500
@@ -459,8 +459,9 @@
        int chi, chl, i, i2, j, last, last_u, dotoffset = 0;
        loff_t cpos;
        int ret = 0;
+       rwlock_t mr_rwlock = RW_LOCK_UNLOCKED;
 
-       lock_kernel();
+       read_lock(&mr_rwlock);
 
        cpos = filp->f_pos;
        /* Fake . and .. for the root directory. */
@@ -642,7 +643,7 @@
        if (unicode)
                free_page((unsigned long)unicode);
 out:
-       unlock_kernel();
+       read_unlock(&mr_rwlock);
        return ret;
 }
 
diff -ur linux-2.6.23/fs/fat/file.c linux-2.6.23-jcl/fs/fat/file.c
--- linux-2.6.23/fs/fat/file.c  2007-10-09 15:31:38.000000000 -0500
+++ linux-2.6.23-jcl/fs/fat/file.c    2007-10-12 11:37:47.000000000
-0500
@@ -160,8 +160,9 @@
        struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
        struct inode *inode = dentry->d_inode;
        int mask, error = 0;
+       rwlock_t mr_rwlock = RW_LOCK_UNLOCKED;
 
-       lock_kernel();
+       write_lock(&mr_rwlock);
 
        /*
         * Expand the file. Since inode_setattr() updates ->i_size
@@ -206,7 +207,7 @@
                mask = sbi->options.fs_fmask;
        inode->i_mode &= S_IFMT | (S_IRWXUGO & ~mask);
 out:
-       unlock_kernel();
+       write_unlock(&mr_rwlock);
        return error;
 }
 
@@ -287,6 +288,7 @@
        struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
        const unsigned int cluster_size = sbi->cluster_size;
        int nr_clusters;
+       rwlock_t mr_rwlock = RW_LOCK_UNLOCKED;
 
        /*
         * This protects against truncating a file bigger than it was
then
@@ -297,9 +299,9 @@
 
        nr_clusters = (inode->i_size + (cluster_size - 1)) >>
sbi->cluster_bits;
 
-       lock_kernel();
+       write_lock(&mr_rwlock);
        fat_free(inode, nr_clusters);
-       unlock_kernel();
+       write_lock(&mr_rwlock);
        fat_flush_inodes(inode->i_sb, inode, NULL);
 }
