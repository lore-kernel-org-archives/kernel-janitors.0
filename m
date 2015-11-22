From: Jeff Layton <jlayton@poochiereds.net>
Date: Sun, 22 Nov 2015 13:04:18 +0000
Subject: Re: [patch] nfsd: fix a warning message
Message-Id: <20151122080418.65d93f86@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151121102850.GA7002@mwanda>
In-Reply-To: <20151121102850.GA7002@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 21 Nov 2015 13:28:50 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The WARN() macro takes a condition and a format string.  The condition
> was accidentally left out here so it just prints the function name
> instead of the message.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 6b800b5..7af023f 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -2240,7 +2240,8 @@ nfsd4_store_cache_entry(struct nfsd4_compoundres *resp)
>  	base = resp->cstate.data_offset;
>  	slot->sl_datalen = buf->len - base;
>  	if (read_bytes_from_xdr_buf(buf, base, slot->sl_data, slot->sl_datalen))
> -		WARN("%s: sessions DRC could not cache compound\n", __func__);
> +		WARN(1, "%s: sessions DRC could not cache compound\n",
> +		     __func__);
>  	return;
>  }
>  

Reviewed-by: Jeff Layton <jlayton@poochiereds.net>
