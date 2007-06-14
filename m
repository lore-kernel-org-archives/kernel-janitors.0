From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 14 Jun 2007 15:59:47 +0000
Subject: Re: [KJ] [PATCH]is_power_of_2-nfs/internal.h
Message-Id: <871wger0gc.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181808534.2474.7.camel@merlin.linuxcoe.com>
In-Reply-To: <1181808534.2474.7.camel@merlin.linuxcoe.com> (vignesh babu's
	message of "Thu, 14 Jun 2007 13:38:54 +0530")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh.babu@wipro.com
Cc: neilb@suse.de, Kernel Janitors List <kernel-janitors@lists.osdl.org>, nfs@lists.sourceforge.net

vignesh babu <vignesh.babu@wipro.com> writes:

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

Did I miss something but why in this case it's not 

+	if (!is_power_of_2(bsize) || nrbitsp) {

?


>  		unsigned char	nrbits;
>  
>  		for (nrbits = 31; nrbits && !(bsize & (1 << nrbits)); nrbits--)
>
> -- 
> Vignesh Babu BM 
> _____________________________________________________________ 
> "Why is it that every time I'm with you, makes me believe in magic?"
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
