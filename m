From: Timothy Shimmin <tes@sgi.com>
Date: Mon, 12 Nov 2007 00:33:30 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <47379F5A.20107@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Timothy Shimmin wrote:
> Timothy Shimmin wrote:
>> Eric Sandeen wrote:
>>> Nicolas Kaiser wrote:
>>>> Remove duplicated defines.
>>>>
>>>> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
>>>> ---
>>> Heh, each defined twice, but used 0 times in the kernel.  Could probably
>>> just remove them altogether (though I guess btoc is used in
>>> xfstests/ltp/doio.c in userspace/xfstests, but that's the *only* place)
>>>
>> Yes, that's what I was just noticing - how they are not used anyway.
>>
>>  > grep -Ir btoc . | egrep -v 'tag|anot'
>> ./linux-2.6/xfs_linux.h:#define btoc(x)         
>> (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define btoct(x)        
>> ((__psunsigned_t)(x)>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define btoc64(x)       
>> (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define btoct64(x)      ((__uint64_t)(x)>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define btoct(x)        
>> ((__psunsigned_t)(x)>>BPCSHIFT)
>> ./linux-2.6/xfs_linux.h:#define btoc(x)         
>> (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
>> ./linux-2.6/xfs_buf.c:  page_count = xfs_buf_btoc(end) - 
>> xfs_buf_btoct(bp->b_file_offset);
>> ./linux-2.6/xfs_buf.c:          page = bp->b_pages[xfs_buf_btoct(boff + 
>> bp->b_offset)];
>> ./linux-2.6/xfs_buf.h:#define xfs_buf_btoc(dd)  (((dd) + 
>> PAGE_CACHE_SIZE-1) >> PAGE_CACHE_SHIFT)
>> ./linux-2.6/xfs_buf.h:#define xfs_buf_btoct(dd) ((dd) >> PAGE_CACHE_SHIFT)
>>
>> --Tim
>>
>>> -Eric
>>>
>>>>  fs/xfs/linux-2.6/xfs_linux.h |    4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>
>>>> --- a/fs/xfs/linux-2.6/xfs_linux.h    2007-11-07 11:26:20.000000000 
>>>> +0100
>>>> +++ b/fs/xfs/linux-2.6/xfs_linux.h    2007-11-11 13:07:11.000000000 
>>>> +0100
>>>> @@ -167,12 +167,8 @@
>>>>  
>>>>  /* clicks to bytes */
>>>>  #define    ctob(x)        ((__psunsigned_t)(x)<<BPCSHIFT)
>>>> -#define btoct(x)        ((__psunsigned_t)(x)>>BPCSHIFT)
>>>>  #define    ctob64(x)    ((__uint64_t)(x)<<BPCSHIFT)
>>>>  
>>>> -/* bytes to clicks */
>>>> -#define btoc(x)         (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
>>>> -
>>>>  #define ENOATTR        ENODATA        /* Attribute not found */
>>>>  #define EWRONGFS    EINVAL        /* Mount with wrong filesystem 
>>>> type */
>>>>  #define EFSCORRUPTED    EUCLEAN        /* Filesystem is corrupted */
>>>>
>>>>
> So I'm thinking of "seeing" your patch and raising you by my attached patch :-)
> 
> --Tim
> 
> 
> -- Binary/unsupported file stripped by Ecartis --
> -- Type: text/x-patch
> -- File: btoc.patch
> 
> 
> 

Where the attachment was supposed to look like...

=====================================Index: fs/xfs/linux-2.6/xfs_linux.h
=====================================
--- a/fs/xfs/linux-2.6/xfs_linux.h	2007-11-12 11:24:05.000000000 +1100
+++ b/fs/xfs/linux-2.6/xfs_linux.h	2007-11-12 11:14:22.818831666 +1100
@@ -159,12 +159,6 @@
  /* number of BB's per block device block */
  #define	BLKDEV_BB		BTOBB(BLKDEV_IOSIZE)

-/* bytes to clicks */
-#define	btoc(x)		(((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
-#define	btoct(x)	((__psunsigned_t)(x)>>BPCSHIFT)
-#define	btoc64(x)	(((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
-#define	btoct64(x)	((__uint64_t)(x)>>BPCSHIFT)
-
  /* off_t bytes to clicks */
  #define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
  #define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
@@ -172,14 +166,6 @@
  /* clicks to off_t bytes */
  #define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)

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

