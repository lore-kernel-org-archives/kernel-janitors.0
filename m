From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Wed, 24 Jun 2020 14:46:04 +0000
Subject: Re: [PATCH] media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_probe()'
Message-Id: <6a59180f-b216-b2f5-0524-17eca8f53992@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kyungmin.park@samsung.com, kamil@wypas.org, a.hajda@samsung.com, mchehab@kernel.org, s.nawrocki@samsung.com, sachin.kamat@linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

On 26/04/2020 22:06, Christophe JAILLET wrote:
> Memory allocated with 'v4l2_m2m_init()' must be freed by a corresponding
> call to 'v4l2_m2m_release()'
> 
> Fixes: 5ce60d790a24 ("[media] s5p-g2d: Add DT based discovery support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/platform/s5p-g2d/g2d.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 6932fd47071b..ded6fa24677c 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -717,12 +717,14 @@ static int g2d_probe(struct platform_device *pdev)
>  	of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
>  	if (!of_id) {
>  		ret = -ENODEV;
> -		goto unreg_video_dev;
> +		goto free_m2m;
>  	}
>  	dev->variant = (struct g2d_variant *)of_id->data;
>  
>  	return 0;
>  
> +free_m2m:
> +	v4l2_m2m_release(dev->m2m_dev);
>  unreg_video_dev:
>  	video_unregister_device(dev->vfd);
>  rel_vdev:
> 

This isn't right. The real problem here is that video_register_device() is
called before several other initialisations as done, such as v4l2_m2m_init and
the of_match_node check.

To do this properly video_register_device() should be called last in the probe()
function.

Regards,

	Hans
