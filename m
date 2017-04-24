From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Mon, 24 Apr 2017 14:23:36 +0000
Subject: Re: [PATCH 2/2] [media] vb2: Fix error handling in '__vb2_buf_mem_alloc'
Message-Id: <20170424142335.GR7456@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170423214030.14854-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170423214030.14854-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On Sun, Apr 23, 2017 at 11:40:30PM +0200, Christophe JAILLET wrote:
> 'call_ptr_memop' can return NULL, so we must test its return value with
> 'IS_ERR_OR_NULL'. Otherwise, the test 'if (mem_priv)' is meaningless.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Note that error checking after 'call_ptr_memop' calls is not consistent
> in this file. I guess that 'IS_ERR_OR_NULL' should be used everywhere
> and that the corresponding error handling code should be tweaked just as
> the code in this function.
> ---
>  drivers/media/v4l2-core/videobuf2-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v4l2-core/videobuf2-core.c
> index c0175ea7e7ad..d1d3f5dd57b9 100644
> --- a/drivers/media/v4l2-core/videobuf2-core.c
> +++ b/drivers/media/v4l2-core/videobuf2-core.c
> @@ -210,7 +210,7 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
>  		mem_priv = call_ptr_memop(vb, alloc,
>  				q->alloc_devs[plane] ? : q->dev,
>  				q->dma_attrs, size, dma_dir, q->gfp_flags);
> -		if (IS_ERR(mem_priv)) {
> +		if (IS_ERR_OR_NULL(mem_priv)) {
>  			if (mem_priv)
>  				ret = PTR_ERR(mem_priv);
>  			goto free;

If NULL will always equate -ENOMEM, shouldn't call_ptr_memop() be changed
instead to convert NULL to ERR_PTR(-ENOMEM)?

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
