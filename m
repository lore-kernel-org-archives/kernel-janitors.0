From: Timothy Shimmin <tes@sgi.com>
Date: Tue, 13 Nov 2007 05:35:40 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <473937AC.2080901@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

David Chinner wrote:
> On Mon, Nov 12, 2007 at 11:33:30AM +1100, Timothy Shimmin wrote:
>> Where the attachment was supposed to look like...
>>
>> =====================================>> Index: fs/xfs/linux-2.6/xfs_linux.h
>> =====================================>>
>> --- a/fs/xfs/linux-2.6/xfs_linux.h	2007-11-12 11:24:05.000000000 +1100
>> +++ b/fs/xfs/linux-2.6/xfs_linux.h	2007-11-12 11:14:22.818831666 +1100
>> @@ -159,12 +159,6 @@
>>   /* number of BB's per block device block */
>>   #define	BLKDEV_BB		BTOBB(BLKDEV_IOSIZE)
>>
>> -/* bytes to clicks */
>> -#define	btoc(x)		(((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
>> -#define	btoct(x)	((__psunsigned_t)(x)>>BPCSHIFT)
>> -#define	btoc64(x)	(((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
>> -#define	btoct64(x)	((__uint64_t)(x)>>BPCSHIFT)
>> -
>>   /* off_t bytes to clicks */
>>   #define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
>>   #define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
>> @@ -172,14 +166,6 @@
>>   /* clicks to off_t bytes */
>>   #define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)
>>
>> -/* clicks to bytes */
>> -#define	ctob(x)		((__psunsigned_t)(x)<<BPCSHIFT)
>> -#define btoct(x)        ((__psunsigned_t)(x)>>BPCSHIFT)
>> -#define	ctob64(x)	((__uint64_t)(x)<<BPCSHIFT)
>> -
>> -/* bytes to clicks */
>> -#define btoc(x)         (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
>> -
>>   #define ENOATTR		ENODATA		/* Attribute not found */
>>   #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
>>   #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
> 
> Perhaps we should look at cleaning up the cusers of offtoc, offtoct, etc
> and killing BPCSHIFT altogether....
> 
Yeah, I had a quick look before, but I will look closer again ;-)

 > egrep -Ir 'offtoc|ctoooff' . | egrep -v "anot|tag"
./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(*offset)),
./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)), -1);
./linux-2.6/xfs_lrw.c:                                  ctooff(offtoct(pos)),
./linux-2.6/xfs_linux.h:#define offtoc(x)       (((__uint64_t)(x)+(NBPC-1))>>BPCSHIFT)
./linux-2.6/xfs_linux.h:#define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)), -1);
./xfs_vnodeops.c:                               ctooff(offtoct(ioffset)),

So we basically just use:

ctooff(offtoct(pos))

where
#define	ctooff(x)	((xfs_off_t)(x)<<BPCSHIFT)
#define offtoct(x)      ((xfs_off_t)(x)>>BPCSHIFT)
#define BPCSHIFT        PAGE_SHIFT      /* LOG2(NBPC) if exact */

seems basically to be a:

#define round_down_page(x) ((x) & ~(PAGE_SIZE - 1))

or just use a
round_down(x, PAGE_SIZE)
and
define the round_down for size which is power of 2.

Like in asm-x86_64/proto.h
#define round_up(x,y) (((x) + (y) - 1) & ~((y)-1))
#define round_down(x,y) ((x) & ~((y)-1))

What way do you reckon?

--Tim
