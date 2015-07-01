From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Jul 2015 14:29:23 +0000
Subject: Re: [PATCH v2 2/3] Staging: android: ion: fix coding style
Message-Id: <20150701142923.GY28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EA18.8060109@zoho.com>
 <5593EF44.3050708@zoho.com>
In-Reply-To: <5593EF44.3050708@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 01, 2015 at 07:16:44PM +0530, Sohny Thomas wrote:
> 
> - Fixed 80 char limit exceeding line
>   and a newline after declarations as per checkpatch.pl
> 
> Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>
> ---
>  drivers/staging/android/ion/ion.c            | 1 +
>  drivers/staging/android/ion/ion_chunk_heap.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 6f48112..e44f5e6 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -1106,6 +1106,7 @@ struct dma_buf *ion_share_dma_buf(struct ion_client *client,
>  	struct ion_buffer *buffer;
>  	struct dma_buf *dmabuf;
>  	bool valid_handle;
> +
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  
>  	mutex_lock(&client->lock);


This is a false positive in checkpatch.pl.  Just leave it as is.

regards,
dan carpenter

