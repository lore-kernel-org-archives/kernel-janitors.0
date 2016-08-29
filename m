From: Jeff Layton <jlayton@poochiereds.net>
Date: Mon, 29 Aug 2016 10:57:47 +0000
Subject: Re: [PATCH] nfsd: constify reply_cache_stats_operations structure
Message-Id: <1472468267.2597.0.camel@poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472416615-24079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472416615-24079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: kernel-janitors@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2016-08-28 at 22:36 +0200, Julia Lawall wrote:
> reply_cache_stats_operations, of type struct file_operations, is
> never
> modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  fs/nfsd/nfsctl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index 65ad016..3bc9693 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -217,7 +217,7 @@ static const struct file_operations
> pool_stats_operations = {
>  	.release	= nfsd_pool_stats_release,
>  };
>  
> -static struct file_operations reply_cache_stats_operations = {
> +static const struct file_operations reply_cache_stats_operations = {
>  	.open		= nfsd_reply_cache_stats_open,
>  	.read		= seq_read,
>  	.llseek		= seq_lseek,
> 

I'm pretty sure Bruce will pick this up for v4.9:

Reviewed-by: Jeff Layton <jlayton@poochiereds.net>
