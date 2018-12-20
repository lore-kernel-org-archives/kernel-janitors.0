From: Paulo Alcantara <palcantara@suse.de>
Date: Thu, 20 Dec 2018 13:01:13 +0000
Subject: Re: [PATCH] cifs: Use kzfree() to free password
Message-Id: <87lg4kxsh2.fsf@paulo.ac>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181220113243.GA20171@kadam>
In-Reply-To: <20181220113243.GA20171@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We should zero out the password before we free it.
>
> Fixes: 3d6cacbb5310 ("cifs: Add DFS cache routines")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/dfs_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
> index f74567788396..006333146a6d 100644
> --- a/fs/cifs/dfs_cache.c
> +++ b/fs/cifs/dfs_cache.c
> @@ -1130,7 +1130,7 @@ static int dup_vol(struct smb_vol *vol, struct smb_vol *new)
>  err_free_unc:
>  	kfree(new->UNC);
>  err_free_password:
> -	kfree(new->password);
> +	kzfree(new->password);
>  err_free_username:
>  	kfree(new->username);
>  	kfree(new);
> -- 
> 2.17.1

Reviewed-by: Paulo Alcantara <palcantara@suse.de>

Thanks!
Paulo
