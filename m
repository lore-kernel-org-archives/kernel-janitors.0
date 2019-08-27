From: Eric Whitney <enwlinux@gmail.com>
Date: Tue, 27 Aug 2019 20:54:45 +0000
Subject: Re: [PATCH] ext4: tidy up white space in count_rsvd()
Message-Id: <20190827205445.3gtjyktwitgnbzx4@rocky>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827084725.GA22301@mwanda>
In-Reply-To: <20190827084725.GA22301@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Eric Whitney <enwlinux@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

* Dan Carpenter <dan.carpenter@oracle.com>:
> This line was indented one tab too far.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, thanks.  You can add:

Reviewed-by: Eric Whitney <enwlinux@gmail.com>

> ---
>  fs/ext4/extents_status.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index dc28a9642452..f17e3f521a17 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -1089,7 +1089,7 @@ static void count_rsvd(struct inode *inode, ext4_lblk_t lblk, long len,
>  	 */
>  	if ((i + sbi->s_cluster_ratio - 1) <= end) {
>  		nclu = (end - i + 1) >> sbi->s_cluster_bits;
> -			rc->ndelonly += nclu;
> +		rc->ndelonly += nclu;
>  		i += nclu << sbi->s_cluster_bits;
>  	}
>  
> -- 
> 2.20.1
> 
