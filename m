From: Frans Klaver <fransklaver@gmail.com>
Date: Wed, 01 Jul 2015 14:18:45 +0000
Subject: Re: [PATCH v2 2/3] Staging: android: ion: fix coding style
Message-Id: <CAH6sp9P8HG6R6qYiPWDuzAErtes1anJBKS1BdgLbcJJ+rRmLTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EA18.8060109@zoho.com>
	<5593EF44.3050708@zoho.com>
In-Reply-To: <5593EF44.3050708@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, arve@android.com, riandrews@android.com, Sumit Semwal <sumit.semwal@linaro.org>, carlos@cgarcia.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 1, 2015 at 3:46 PM, Sohny Thomas <sohnythomas@zoho.com> wrote:
>
> - Fixed 80 char limit exceeding line
>   and a newline after declarations as per checkpatch.pl
>
> Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>

You can remove the dash, and fix the -off- typo (hint: use 'git commit
-s' for automating it). Maybe hint towards what coding style is fixed
in the summary:

staging: android: ion: fix line over 80 characters

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
>         struct ion_buffer *buffer;
>         struct dma_buf *dmabuf;
>         bool valid_handle;
> +
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>
>         mutex_lock(&client->lock);
> diff --git a/drivers/staging/android/ion/ion_chunk_heap.c b/drivers/staging/android/ion/ion_chunk_heap.c
> index 5474615..0813163 100644
> --- a/drivers/staging/android/ion/ion_chunk_heap.c
> +++ b/drivers/staging/android/ion/ion_chunk_heap.c
> @@ -173,8 +173,8 @@ struct ion_heap *ion_chunk_heap_create(struct ion_platform_heap *heap_data)
>         chunk_heap->heap.ops = &chunk_heap_ops;
>         chunk_heap->heap.type = ION_HEAP_TYPE_CHUNK;
>         chunk_heap->heap.flags = ION_HEAP_FLAG_DEFER_FREE;
> -       pr_debug("%s: base %lu size %zu align %ld\n", __func__, chunk_heap->base,
> -               heap_data->size, heap_data->align);
> +       pr_debug("%s: base %lu size %zu align %ld\n", __func__,
> +               chunk_heap->base, heap_data->size, heap_data->align);
>
>         return &chunk_heap->heap;
>
> --
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
