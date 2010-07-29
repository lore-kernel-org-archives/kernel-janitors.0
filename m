From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Jul 2010 07:36:10 +0000
Subject: [patch] kexec: return -EFAULT on copy_to_user() failures
Message-Id: <20100729073609.GR26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to/from_user() returns the number of bytes remaining to be copied.
It never returns a negative value.  The correct return code is -EFAULT
and not -EIO.

All the callers check for non-zero returns so that's Ok, but the return
code is passed to the user so we should fix this.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 474a847..ab2258b 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -151,8 +151,10 @@ static int do_kimage_alloc(struct kimage **rimage, unsigned long entry,
 	image->nr_segments = nr_segments;
 	segment_bytes = nr_segments * sizeof(*segments);
 	result = copy_from_user(image->segment, segments, segment_bytes);
-	if (result)
+	if (result) {
+		result = -EFAULT;
 		goto out;
+	}
 
 	/*
 	 * Verify we have good destination addresses.  The caller is
@@ -827,7 +829,7 @@ static int kimage_load_normal_segment(struct kimage *image,
 		result = copy_from_user(ptr, buf, uchunk);
 		kunmap(page);
 		if (result) {
-			result = (result < 0) ? result : -EIO;
+			result = -EFAULT;
 			goto out;
 		}
 		ubytes -= uchunk;
@@ -882,7 +884,7 @@ static int kimage_load_crash_segment(struct kimage *image,
 		kexec_flush_icache_page(page);
 		kunmap(page);
 		if (result) {
-			result = (result < 0) ? result : -EIO;
+			result = -EFAULT;
 			goto out;
 		}
 		ubytes -= uchunk;
