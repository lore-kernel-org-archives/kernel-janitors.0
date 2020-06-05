From: Shukun Tan <tanshukun1@huawei.com>
Date: Fri, 05 Jun 2020 01:19:53 +0000
Subject: Re: [PATCH v2] crypto: hisilicon - allow smaller reads in debugfs
Message-Id: <3e9b204f-ef53-31c5-afcd-e0791224c2b0@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602135409.GA59808@mwanda>
In-Reply-To: <20200602135409.GA59808@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b6da310b-e633-9f74-f7af-7791d803aaf5@huawei.com, Zhou Wang <wangzhou1@hisilicon.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 2020/6/2 21:54, Dan Carpenter wrote:
> Originally this code rejected any read less than 256 bytes.  There
> is no need for this artificial limit.  We should just use the normal
> helper functions to read a string from the kernel.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Use simple_read_from_buffer().  The v1 was slightly half arsed
> because I left the original check for:
> 
> 	if (*pos)
> 		return 0;
> 
> So it could result in partial reads.  The new code means that if you
> want to read the buffer one byte at a time, that's fine or if you want
> to read it in one 256 byte chunk that's also fine.  Plus it deletes 21
> lines of code and is a lot cleaner.
> 

In fact, In our original design, we do not hope the user do the partial reads.
Thank you for your work, but I still insist on adding this limit.

Thanks,
Shukun

>  drivers/crypto/hisilicon/qm.c | 33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> index 9bb263cec6c30..13ccb9e29a2e1 100644
> --- a/drivers/crypto/hisilicon/qm.c
> +++ b/drivers/crypto/hisilicon/qm.c
> @@ -1064,19 +1064,10 @@ static ssize_t qm_cmd_read(struct file *filp, char __user *buffer,
>  	char buf[QM_DBG_READ_LEN];
>  	int len;
>  
> -	if (*pos)
> -		return 0;
> -
> -	if (count < QM_DBG_READ_LEN)
> -		return -ENOSPC;
> +	len = scnprintf(buf, QM_DBG_READ_LEN, "%s\n",
> +			"Please echo help to cmd to get help information");
>  
> -	len = snprintf(buf, QM_DBG_READ_LEN, "%s\n",
> -		       "Please echo help to cmd to get help information");
> -
> -	if (copy_to_user(buffer, buf, len))
> -		return -EFAULT;
> -
> -	return (*pos = len);
> +	return simple_read_from_buffer(buffer, count, pos, buf, len);
>  }
>  
>  static void *qm_ctx_alloc(struct hisi_qm *qm, size_t ctx_size,
> @@ -2691,24 +2682,12 @@ static ssize_t qm_status_read(struct file *filp, char __user *buffer,
>  {
>  	struct hisi_qm *qm = filp->private_data;
>  	char buf[QM_DBG_READ_LEN];
> -	int val, cp_len, len;
> -
> -	if (*pos)
> -		return 0;
> -
> -	if (count < QM_DBG_READ_LEN)
> -		return -ENOSPC;
> +	int val, len;
>  
>  	val = atomic_read(&qm->status.flags);
> -	len = snprintf(buf, QM_DBG_READ_LEN, "%s\n", qm_s[val]);
> -	if (!len)
> -		return -EFAULT;
> -
> -	cp_len = copy_to_user(buffer, buf, len);
> -	if (cp_len)
> -		return -EFAULT;
> +	len = scnprintf(buf, QM_DBG_READ_LEN, "%s\n", qm_s[val]);
>  
> -	return (*pos = len);
> +	return simple_read_from_buffer(buffer, count, pos, buf, len);
>  }
>  
>  static const struct file_operations qm_status_fops = {
> 
