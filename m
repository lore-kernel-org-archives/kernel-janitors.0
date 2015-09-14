From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 14 Sep 2015 09:53:50 +0000
Subject: Re: [PATCH 33/39] rbd: drop null test before destroy functions
Message-Id: <CAOi1vP8W58-RqCnOfLnL5rwF_r=XAxYDgOgqxtLdN2BJ5MBi1Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
	<1442146532-9100-34-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-34-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Sage Weil <sage@redhat.com>, Alex Elder <elder@kernel.org>, Ceph Development <ceph-devel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Sep 13, 2015 at 3:15 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Remove unneeded NULL test.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@ expression x; @@
> -if (x != NULL) {
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
>   x = NULL;
> -}
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/block/rbd.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index d93a037..0507246 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -5645,10 +5645,8 @@ static int rbd_slab_init(void)
>         if (rbd_segment_name_cache)
>                 return 0;
>  out_err:
> -       if (rbd_obj_request_cache) {
> -               kmem_cache_destroy(rbd_obj_request_cache);
> -               rbd_obj_request_cache = NULL;
> -       }
> +       kmem_cache_destroy(rbd_obj_request_cache);
> +       rbd_obj_request_cache = NULL;
>
>         kmem_cache_destroy(rbd_img_request_cache);
>         rbd_img_request_cache = NULL;

Applied.

Thanks,

                Ilya
