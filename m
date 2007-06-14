From: Trond Myklebust <trond.myklebust@fys.uio.no>
Date: Thu, 14 Jun 2007 15:45:58 +0000
Subject: [KJ] Re: [NFS] [PATCH]is_power_of_2-nfs/internal.h
Message-Id: <1181835958.6957.2.camel@heimdal.trondhjem.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181808534.2474.7.camel@merlin.linuxcoe.com>
In-Reply-To: <1181808534.2474.7.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh.babu@wipro.com
Cc: neilb@suse.de, Kernel Janitors List <kernel-janitors@lists.osdl.org>, nfs@lists.sourceforge.net

On Thu, 2007-06-14 at 13:38 +0530, vignesh babu wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> --- 
> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index ad2b40d..5dca432 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -3,6 +3,7 @@
>   */
>  
>  #include <linux/mount.h>
> +#include <linux/log2.h>
>  
>  struct nfs_string;
>  struct nfs_mount_data;
> @@ -167,7 +168,7 @@ static inline
>  unsigned long nfs_block_bits(unsigned long bsize, unsigned char *nrbitsp)
>  {
>  	/* make sure blocksize is a power of two */
> -	if ((bsize & (bsize - 1)) || nrbitsp) {
> +	if (is_power_of_2(bsize) || nrbitsp) {
>  		unsigned char	nrbits;
>  
>  		for (nrbits = 31; nrbits && !(bsize & (1 << nrbits)); nrbits--)
> 

We don't need the extra test for bsize = 0 that this introduces: bsize
is guaranteed to be at least 1024 or greater.

Trond

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
