From: John Johansen <john.johansen@canonical.com>
Date: Wed, 31 Oct 2018 09:13:21 +0000
Subject: Re: [PATCH] apparmor: clean an indentation issue, remove extraneous space
Message-Id: <578c025a-d656-4c15-e14b-4325211613bd@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181030141131.3258-1-colin.king@canonical.com>
In-Reply-To: <20181030141131.3258-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/30/18 7:11 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to clean up an indentation issue, remove space
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin,

I have pulled this into apparmor-next

> ---
>  security/apparmor/apparmorfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 658b85639006..33f89b3f28a4 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1744,7 +1744,7 @@ static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
>  	if (error)
>  		return error;
>  
> -	 parent = aa_get_ns(dir->i_private);
> +	parent = aa_get_ns(dir->i_private);
>  	/* rmdir calls the generic securityfs functions to remove files
>  	 * from the apparmor dir. It is up to the apparmor ns locking
>  	 * to avoid races.
> 
