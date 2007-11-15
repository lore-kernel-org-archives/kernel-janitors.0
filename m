From: Timothy Shimmin <tes@sgi.com>
Date: Thu, 15 Nov 2007 00:54:04 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <473B98AC.2000600@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

David Chinner wrote:
> On Wed, Nov 14, 2007 at 01:46:52PM +1100, Timothy Shimmin wrote:
>> David Chinner wrote:
>>> Just replace them with (val & PAGE_CACHE_MASK)
>                                   ^^^^^^^^^^^^^^^
> ......
>> --- a/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 13:02:46.000000000 +1100
>> +++ b/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 12:36:59.920080014 +1100
>> @@ -254,9 +254,8 @@ xfs_read(
>>
>>   	if (unlikely(ioflags & IO_ISDIRECT)) {
>>   		if (VN_CACHED(vp))
>> -			ret = xfs_flushinval_pages(ip,
>> -					ctooff(offtoct(*offset)),
>> -					-1, FI_REMAPF_LOCKED);
>> +			ret = xfs_flushinval_pages(ip, (*offset & PAGE_MASK),
>                                                                   ^^^^^^^^^
> 
> s/PAGE_MASK/PAGE_CACHE_MASK/g
> 

Okay.

While here, looking at a few others...

I'll get rid of BPCSHIFT.

And then...

#define NBPP            PAGE_SIZE
#define NDPP            (1 << (PAGE_SHIFT - 9)) <--- not used - another to nuke
#define NBPC            PAGE_SIZE <----- used once

grep -Ir 'NBPC' . | egrep -v 'tag|anot|diff'
./linux-2.6/xfs_linux.h:#define NBPC            PAGE_SIZE       /* Number of bytes per click */
./xfs_itable.c: irbuf = kmem_zalloc_greedy(&irbsize, NBPC, NBPC * 4,

 > grep -Ir 'NBPP' . | egrep -v 'tag|anot|diff|NBPPR'
./linux-2.6/xfs_linux.h:#define NBPP            PAGE_SIZE
./quota/xfs_qm.h:#define XFS_QM_HASHSIZE_LOW            (NBPP / sizeof(xfs_dqhash_t))
./quota/xfs_qm.h:#define XFS_QM_HASHSIZE_HIGH           ((NBPP * 4) / sizeof(xfs_dqhash_t))
./xfs_bmap.c:   } else if (mp->m_sb.sb_blocksize >= NBPP) {
./xfs_bmap.c:           args.prod = NBPP >> mp->m_sb.sb_blocklog;
./xfs_itable.c: bcount = MIN(left, (int)(NBPP / sizeof(*buffer)));
./xfs_log.c:                    kmem_free(tic, NBPP);
./xfs_log.c:    uint            i = (NBPP / sizeof(xlog_ticket_t)) - 2;
./xfs_log.c:    buf = (xfs_caddr_t) kmem_zalloc(NBPP, KM_SLEEP);
./xfs_vnodeops.c:       rounding = max_t(uint, 1 << mp->m_sb.sb_blocklog, NBPP);

Might as well get rid of NBPC and replace by NBPP.

Is it just worth s/NBPC/PAGE_SIZE/g ?

Okay, the xfs_vnodeops.c one should be PAGE_CACHE_SIZE, then right?
How about the bmap ones?

I don't know if I want to keep asking questions ... ;-)

--Tim

