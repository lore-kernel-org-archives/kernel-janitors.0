From: Timothy Shimmin <tes@sgi.com>
Date: Wed, 14 Nov 2007 02:46:52 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <473A619C.8040206@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

David Chinner wrote:
> On Tue, Nov 13, 2007 at 04:35:40PM +1100, Timothy Shimmin wrote:
>> David Chinner wrote:
>>> Perhaps we should look at cleaning up the cusers of offtoc, offtoct, etc
>>> and killing BPCSHIFT altogether....
>>>
>> Yeah, I had a quick look before, but I will look closer again ;-)
>>
>>  > egrep -Ir 'offtoc|ctoooff' . | egrep -v "anot|tag"
>> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(*offset)),
>> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)), -1);
>> ./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)),
>> ./linux-2.6/xfs_linux.h:#define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
>> ./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)), -1);
>> ./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)),
>>
>> So we basically just use:
>>
>> ctooff(offtoct(pos))
>>
>> where
>> #define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)
>> #define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
>> #define BPCSHIFT        PAGE_SHIFT      /* LOG2(NBPC) if exact */
>>
>> seems basically to be a:
>>
>> #define round_down_page(x) ((x) & ~(PAGE_SIZE - 1))
>>
>> or just use a
>> round_down(x, PAGE_SIZE)
>> and
>> define the round_down for size which is power of 2.
>>
>> Like in asm-x86_64/proto.h
>> #define round_up(x,y) (((x) + (y) - 1) & ~((y)-1))
>> #define round_down(x,y) ((x) & ~((y)-1))
>>
>> What way do you reckon?
> 
> Neither ;)

:)

> 
> Just replace them with (val & PAGE_CACHE_MASK)
> 
Ah, there is already a macro for ~(PAGE_SIZE - 1) that would
be good. (You can tell I look at a lot of this page code:)

> Actually, the code in xfs_vnodeops.c culd probably just be removed; the
> ioffset variable is already rounded to a multiple of page size....
> 
Yep...
         rounding = max_t(uint, 1 << mp->m_sb.sb_blocklog, NBPP);
         ioffset = offset & ~(rounding - 1);

Looks like we used to use ioffset directly in a call to xfs_inval_cached_pages()
and when hch moved to VOP_FLUSH_INVALPAGES we used the ctoff(offtoct(...

> Cheers,
> 
> dave.

Remove the BPCSHIFT based macros from XFS.

The BPCSHIFT based macros, btoc*, ctob*, offtoc* and ctooff
are either not used or don't need to be used.
Initial patch and motivation from Nicolas Kaiser.

Signed-Off-By: Tim Shimmin <tes@sgi.com>
---
  b/fs/xfs/linux-2.6/xfs_linux.h |   21 ---------------------
  b/fs/xfs/linux-2.6/xfs_lrw.c   |    9 ++++-----
  b/fs/xfs/xfs_vnodeops.c        |    7 ++-----
  3 files changed, 6 insertions(+), 31 deletions(-)

=====================================Index: fs/xfs/linux-2.6/xfs_linux.h
=====================================
--- a/fs/xfs/linux-2.6/xfs_linux.h	2007-11-14 13:02:46.000000000 +1100
+++ b/fs/xfs/linux-2.6/xfs_linux.h	2007-11-14 12:40:25.297746498 +1100
@@ -159,27 +159,6 @@
  /* number of BB's per block device block */
  #define	BLKDEV_BB		BTOBB(BLKDEV_IOSIZE)

-/* bytes to clicks */
-#define	btoc(x)		(((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
-#define	btoct(x)	((__psunsigned_t)(x)>>BPCSHIFT)
-#define	btoc64(x)	(((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
-#define	btoct64(x)	((__uint64_t)(x)>>BPCSHIFT)
-
-/* off_t bytes to clicks */
-#define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
-#define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
-
-/* clicks to off_t bytes */
-#define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)
-
-/* clicks to bytes */
-#define	ctob(x)		((__psunsigned_t)(x)<<BPCSHIFT)
-#define btoct(x)        ((__psunsigned_t)(x)>>BPCSHIFT)
-#define	ctob64(x)	((__uint64_t)(x)<<BPCSHIFT)
-
-/* bytes to clicks */
-#define btoc(x)         (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
-
  #define ENOATTR		ENODATA		/* Attribute not found */
  #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
  #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */

=====================================Index: fs/xfs/linux-2.6/xfs_lrw.c
=====================================
--- a/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 13:02:46.000000000 +1100
+++ b/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 12:36:59.920080014 +1100
@@ -254,9 +254,8 @@ xfs_read(

  	if (unlikely(ioflags & IO_ISDIRECT)) {
  		if (VN_CACHED(vp))
-			ret = xfs_flushinval_pages(ip,
-					ctooff(offtoct(*offset)),
-					-1, FI_REMAPF_LOCKED);
+			ret = xfs_flushinval_pages(ip, (*offset & PAGE_MASK),
+						    -1, FI_REMAPF_LOCKED);
  		mutex_unlock(&inode->i_mutex);
  		if (ret) {
  			xfs_iunlock(ip, XFS_IOLOCK_SHARED);
@@ -742,9 +741,9 @@ retry:
  		if (VN_CACHED(vp)) {
  			WARN_ON(need_i_mutex = 0);
  			xfs_inval_cached_trace(xip, pos, -1,
-					ctooff(offtoct(pos)), -1);
+					(pos & PAGE_MASK), -1);
  			error = xfs_flushinval_pages(xip,
-					ctooff(offtoct(pos)),
+					(pos & PAGE_MASK),
  					-1, FI_REMAPF_LOCKED);
  			if (error)
  				goto out_unlock_internal;

=====================================Index: fs/xfs/xfs_vnodeops.c
=====================================
--- a/fs/xfs/xfs_vnodeops.c	2007-11-14 13:02:46.000000000 +1100
+++ b/fs/xfs/xfs_vnodeops.c	2007-11-14 12:32:36.182055952 +1100
@@ -4168,11 +4168,8 @@ xfs_free_file_space(
  	ioffset = offset & ~(rounding - 1);

  	if (VN_CACHED(vp) != 0) {
-		xfs_inval_cached_trace(ip, ioffset, -1,
-				ctooff(offtoct(ioffset)), -1);
-		error = xfs_flushinval_pages(ip,
-				ctooff(offtoct(ioffset)),
-				-1, FI_REMAPF_LOCKED);
+		xfs_inval_cached_trace(ip, ioffset, -1, ioffset, -1);
+		error = xfs_flushinval_pages(ip, ioffset, -1, FI_REMAPF_LOCKED);
  		if (error)
  			goto out_unlock_iolock;
  	}

