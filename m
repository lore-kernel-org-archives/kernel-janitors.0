From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Date: Mon, 11 Nov 2019 12:25:57 +0000
Subject: Re: [PATCH][next] xen/gntdev: remove redundant non-zero check on ret
Message-Id: <04efe197-2914-ab1d-918b-8899aa0354af@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111122009.67789-1-colin.king@canonical.com>
In-Reply-To: <20191111122009.67789-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11.11.19 13:20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The non-zero check on ret is always going to be false because
> ret was initialized as zero and the only place it is set to
> non-zero contains a return path before the non-zero check. Hence
> the check is redundant and can be removed.

Which version did you patch against? In current master the above
statement is not true.


Juergen

> 
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/xen/gntdev.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 10cc5e9e612a..07d80b176118 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -524,11 +524,6 @@ static int gntdev_open(struct inode *inode, struct file *flip)
>   	}
>   #endif
>   
> -	if (ret) {
> -		kfree(priv);
> -		return ret;
> -	}
> -
>   	flip->private_data = priv;
>   #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
>   	priv->dma_dev = gntdev_miscdev.this_device;
> 
