From: walter harms <wharms@bfs.de>
Date: Thu, 28 Oct 2010 07:16:08 +0000
Subject: Re: [patch] nfs: check kmalloc() return
Message-Id: <4CC92338.7070304@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028044403.GV6062@bicker>
In-Reply-To: <20101028044403.GV6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org



Dan Carpenter schrieb:
> The decode_and_add_ds() should return NULL on failure.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
> index 51fe64a..098113c 100644
> --- a/fs/nfs/nfs4filelayoutdev.c
> +++ b/fs/nfs/nfs4filelayoutdev.c
> @@ -219,6 +219,8 @@ decode_and_add_ds(__be32 **pp, struct inode *inode)
>  		goto out_err;
>  	}
>  	buf = kmalloc(rlen + 1, GFP_KERNEL);
> +	if (!buf)
> +		goto out_err;
>  	buf[rlen] = '\0';
>  	memcpy(buf, r_addr, rlen);
>  

it seems that r_addr is a string, then kstdup() is emulated here.

re,
 wh



> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
