From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Tue, 09 Feb 2021 16:52:32 +0000
Subject: Re: [PATCH] fs/jfs: fix potential integer overflow on shift of a int
Message-Id: <044b0372-8612-6fb9-23c5-9c4e6ab79114@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210205171137.208121-1-colin.king@canonical.com>
In-Reply-To: <20210205171137.208121-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tino Reichardt <milky-kernel@mcmilk.de>, jfs-discussion@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/5/21 11:11 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then assigned to a signed 64 bit integer. In the case where
> l2nb is 32 or more this can lead to an overflow.  Avoid this by shifting
> using the BIT_ULL macro instead.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: b40c2e665cd5 ("fs/jfs: TRIM support for JFS Filesystem")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   fs/jfs/jfs_dmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index 94b7c1cb5ceb..47dbca7e52e0 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -1656,7 +1656,7 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
>   		} else if (rc = -ENOSPC) {
>   			/* search for next smaller log2 block */
>   			l2nb = BLKSTOL2(nblocks) - 1;
> -			nblocks = 1 << l2nb;
> +			nblocks = BIT_ULL(l2nb);

I'm not sure I like the use of this macro here. It seems to imply a bit 
flag of some sort. I think it would be clearer to use

			nblocks = 1ULL << l2nb;

Maybe 1LL rather than 1ULL since nblocks is s64.

>   		} else {
>   			/* Trim any already allocated blocks */
>   			jfs_error(bmp->db_ipbmap->i_sb, "-EIO\n");
> 
