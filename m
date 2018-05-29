From: "Bryant G. Ly" <bryantly@linux.ibm.com>
Date: Tue, 29 May 2018 14:15:39 +0000
Subject: Re: [PATCH -next] misc: ibmvmc: Use GFP_ATOMIC under spin lock
Message-Id: <995601ab-6fa5-4a72-fd49-337976755861@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527327959-83701-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527327959-83701-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>, Steven Royer <seroyer@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 5/26/18 4:45 AM, Wei Yongjun wrote:

> The function alloc_dma_buffer() is called from ibmvmc_add_buffer(),
> in which a spin lock be held here, so we should use GFP_ATOMIC when
> a lock is held.
>
> Fixes: 0eca353e7ae7 ("misc: IBM Virtual Management Channel Driver (VMC)")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/ibmvmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
> index fb83d13..8f82bb9 100644
> --- a/drivers/misc/ibmvmc.c
> +++ b/drivers/misc/ibmvmc.c
> @@ -273,7 +273,7 @@ static void *alloc_dma_buffer(struct vio_dev *vdev, size_t size,
>  			      dma_addr_t *dma_handle)
>  {
>  	/* allocate memory */
> -	void *buffer = kzalloc(size, GFP_KERNEL);
> +	void *buffer = kzalloc(size, GFP_ATOMIC);
>
>  	if (!buffer) {
>  		*dma_handle = 0;
>
Reviewed-by: Bryant G. Ly <bryantly@linux.vnet.ibm.com>

