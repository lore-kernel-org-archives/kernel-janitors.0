From: Ralph Campbell <rcampbell@nvidia.com>
Date: Mon, 11 May 2020 19:49:36 +0000
Subject: Re: [PATCH] mm/hmm/test: Fix some copy_to_user() error handling
Message-Id: <45d2a836-67d1-ad07-7a1d-0031865f6742@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511183704.GA225608@mwanda>
In-Reply-To: <20200511183704.GA225608@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org


On 5/11/20 11:37 AM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes which weren't
> copied but we want to return negative error codes.  Also in dmirror_write()
> if the copy_from_user() fails then there is some cleanup needed before
> we can return so I fixed that as well.
> 
> Fixes: 5d5e54be8a1e3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing this.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   lib/test_hmm.c | 41 +++++++++++++++++++++++++----------------
>   1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 00bca6116f930..fd4889f7b3d90 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -360,9 +360,11 @@ static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   		cmd->faults++;
>   	}
>   
> -	if (ret = 0)
> -		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> -					bounce.size);
> +	if (ret = 0) {
> +		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> +				 bounce.size))
> +			ret = -EFAULT;
> +	}
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -412,10 +414,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   	ret = dmirror_bounce_init(&bounce, start, size);
>   	if (ret)
>   		return ret;
> -	ret = copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
> -				bounce.size);
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
> +			   bounce.size)) {
> +		ret = -EFAULT;
> +		goto fini;
> +	}
>   
>   	while (1) {
>   		mutex_lock(&dmirror->mutex);
> @@ -431,6 +434,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   		cmd->faults++;
>   	}
>   
> +fini:
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -715,9 +719,11 @@ static int dmirror_migrate(struct dmirror *dmirror,
>   	mutex_lock(&dmirror->mutex);
>   	ret = dmirror_do_read(dmirror, start, end, &bounce);
>   	mutex_unlock(&dmirror->mutex);
> -	if (ret = 0)
> -		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> -					bounce.size);
> +	if (ret = 0) {
> +		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> +				 bounce.size))
> +			ret = -EFAULT;
> +	}
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -886,9 +892,10 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>   			break;
>   
>   		n = (range.end - range.start) >> PAGE_SHIFT;
> -		ret = copy_to_user(uptr, perm, n);
> -		if (ret)
> +		if (copy_to_user(uptr, perm, n)) {
> +			ret = -EFAULT;
>   			break;
> +		}
>   
>   		cmd->cpages += n;
>   		uptr += n;
> @@ -911,9 +918,8 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>   	if (!dmirror)
>   		return -EINVAL;
>   
> -	ret = copy_from_user(&cmd, uarg, sizeof(cmd));
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(&cmd, uarg, sizeof(cmd)))
> +		return -EFAULT;
>   
>   	if (cmd.addr & ~PAGE_MASK)
>   		return -EINVAL;
> @@ -946,7 +952,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>   	if (ret)
>   		return ret;
>   
> -	return copy_to_user(uarg, &cmd, sizeof(cmd));
> +	if (copy_to_user(uarg, &cmd, sizeof(cmd)))
> +		return -EFAULT;
> +
> +	return 0;
>   }
>   
>   static const struct file_operations dmirror_fops = {
> 
