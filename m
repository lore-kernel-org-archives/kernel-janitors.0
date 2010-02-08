From: Christoph Hellwig <hch@infradead.org>
Date: Mon, 08 Feb 2010 19:37:26 +0000
Subject: Re: [PATCH 11/11] fs/xfs: Correct NULL test
Message-Id: <20100208193726.GB9527@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060944580.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060944580.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: xfs-masters@oss.sgi.com, xfs@oss.sgi.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <aelder@sgi.com>

On Sat, Feb 06, 2010 at 09:45:15AM +0100, Julia Lawall wrote:
> diff --git a/fs/xfs/quota/xfs_qm.c b/fs/xfs/quota/xfs_qm.c
> index 11cfd82..4318cd5 100644
> --- a/fs/xfs/quota/xfs_qm.c
> +++ b/fs/xfs/quota/xfs_qm.c
> @@ -123,7 +123,7 @@ xfs_Gqm_init(void)
>  		goto out;
>  
>  	gdqhash = kmem_zalloc_large(hsize);
> -	if (!udqhash)
> +	if (!gdqhash)
>  		goto out_free_udqhash;

Thanks, this looks correct,


Reviewed-by: Christoph Hellwig <hch@lst.de>
