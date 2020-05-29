From: Zhou Wang <wangzhou1@hisilicon.com>
Date: Fri, 29 May 2020 06:24:01 +0000
Subject: Re: [PATCH] crypto: hisilicon/qm - allow smaller reads in debugfs
Message-Id: <5ED0AA81.5080105@hisilicon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528123703.GA1219412@mwanda>
In-Reply-To: <20200528123703.GA1219412@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020/5/28 20:37, Dan Carpenter wrote:
> Originally this code rejected any read less than 256 bytes.  There
> is no need for this artificial limit.
> 
> Also I have changed the snprintf() functions to scnprintf().  The
> difference is that snprintf() returns the number of bytes which would
> have been copied if there were enough space and scnprintf() returns the
> number of bytes which were actually copied.  It doesn't matter here
> because the strings are very short so they can't go over 256 bytes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thanks!
Reviewed-by: Zhou Wang <wangzhou1@hisilicon.com>

> ---
>  drivers/crypto/hisilicon/qm.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> index a781c02251980..9c0c9f500d91d 100644
> --- a/drivers/crypto/hisilicon/qm.c
> +++ b/drivers/crypto/hisilicon/qm.c
> @@ -1076,16 +1076,15 @@ static ssize_t qm_cmd_read(struct file *filp, char __user *buffer,
>  	if (*pos)
>  		return 0;
>  
> -	if (count < QM_DBG_READ_LEN)
> -		return -ENOSPC;
> -
> -	len = snprintf(buf, QM_DBG_READ_LEN, "%s\n",
> +	len = scnprintf(buf, QM_DBG_READ_LEN, "%s\n",
>  		       "Please echo help to cmd to get help information");
>  
> +	len = min_t(size_t, len, count);
>  	if (copy_to_user(buffer, buf, len))
>  		return -EFAULT;
>  
> -	return (*pos = len);
> +	*pos = len;
> +	return len;
>  }
>  
>  static void *qm_ctx_alloc(struct hisi_qm *qm, size_t ctx_size,
> @@ -2710,19 +2709,18 @@ static ssize_t qm_status_read(struct file *filp, char __user *buffer,
>  	if (*pos)
>  		return 0;
>  
> -	if (count < QM_DBG_READ_LEN)
> -		return -ENOSPC;
> -
>  	val = atomic_read(&qm->status.flags);
> -	len = snprintf(buf, QM_DBG_READ_LEN, "%s\n", qm_s[val]);
> +	len = scnprintf(buf, QM_DBG_READ_LEN, "%s\n", qm_s[val]);
>  	if (!len)
>  		return -EFAULT;
>  
> +	len = min_t(size_t, len, count);
>  	cp_len = copy_to_user(buffer, buf, len);
>  	if (cp_len)
>  		return -EFAULT;
>  
> -	return (*pos = len);
> +	*pos = len;
> +	return len;
>  }
>  
>  static const struct file_operations qm_status_fops = {
> 
