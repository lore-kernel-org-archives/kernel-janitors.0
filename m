From: Trond Myklebust <Trond.Myklebust@netapp.com>
Date: Thu, 28 Oct 2010 18:18:01 +0000
Subject: Re: [patch] nfs: testing the wrong variable
Message-Id: <1288289881.14221.14.camel@heimdal.trondhjem.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028060557.GY6062@bicker>
In-Reply-To: <20101028060557.GY6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2010-10-28 at 08:05 +0200, Dan Carpenter wrote:
> The intent was to test "*desc" for allocation failures, but it tests
> "desc" which is always a valid pointer here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
> index dec47ed..4e2d9b6 100644
> --- a/fs/nfs/idmap.c
> +++ b/fs/nfs/idmap.c
> @@ -123,7 +123,7 @@ static ssize_t nfs_idmap_get_desc(const char *name, size_t namelen,
>  	size_t desclen = typelen + namelen + 2;
>  
>  	*desc = kmalloc(desclen, GFP_KERNEL);
> -	if (!desc)
> +	if (!*desc)
>  		return -ENOMEM;
>  
>  	cp = *desc;

Thanks! Applied!

Trond
