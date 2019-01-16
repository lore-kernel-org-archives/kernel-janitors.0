From: Christian Brauner <christian@brauner.io>
Date: Wed, 16 Jan 2019 08:41:10 +0000
Subject: Re: [PATCH -next v2] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <20190116084108.lubcpqaflkzmwfvp@brauner.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
 <1547627642-96450-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547627642-96450-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 16, 2019 at 08:34:02AM +0000, Wei Yongjun wrote:
> Fix to return a negative error code -ENOMEM from the new_inode() and
> d_make_root() error handling cases instead of 0, as done elsewhere in
> this function.
> 
> Fixes: 3ad20fe393b3 ("binder: implement binderfs")

This should be:

Fixes: 849d540ddfcd ("binderfs: implement "max" mount option")

If you have added that feel free to also add my Reviewed-by.

Thanks!
Christian

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: move 'ret = -ENOMEM' out of if
> ---
>  drivers/android/binderfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
> index 9518e2e..e4ff4c3 100644
> --- a/drivers/android/binderfs.c
> +++ b/drivers/android/binderfs.c
> @@ -518,6 +518,7 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	sb->s_fs_info = info;
>  
> +	ret = -ENOMEM;
>  	inode = new_inode(sb);
>  	if (!inode)
>  		goto err_without_dentry;
> 
> 
> 
