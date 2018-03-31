From: John Johansen <john.johansen@canonical.com>
Date: Sat, 31 Mar 2018 04:12:30 +0000
Subject: Re: [PATCH][next] apparmor: fix memory leak on buffer on error exit path
Message-Id: <5ddbfd4d-12f3-1cde-c080-8fde508c664f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180327133558.13072-1-colin.king@canonical.com>
In-Reply-To: <20180327133558.13072-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 03/27/2018 06:35 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently on the error exit path the allocated buffer is not free'd
> causing a memory leak. Fix this by kfree'ing it.
> 
> Detected by CoverityScan, CID#1466876 ("Resource leaks")
> 
> Fixes: 1180b4c757aa ("apparmor: fix dangling symlinks to policy rawdata after replacement")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

thanks Colin

I've pulled it into apparmor-next

> ---
>  security/apparmor/apparmorfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 96bb6b73af65..949dd8a48164 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1497,8 +1497,10 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
>  	}
>  
>  	error = snprintf(s, size, "raw_data/%s/%s", dirname, fname);
> -	if (error >= size || error < 0)
> +	if (error >= size || error < 0) {
> +		kfree(buffer);
>  		return ERR_PTR(-ENAMETOOLONG);
> +	}
>  
>  	return buffer;
>  }
> 

