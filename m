From: Helen Koike <helen.koike@collabora.com>
Date: Tue, 08 Oct 2019 13:22:42 +0000
Subject: Re: [PATCH -next] media: vimc: Fix error return code in vimc_register_devices()
Message-Id: <874313fb-a141-1762-a883-fc004bb7e043@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008090133.9760-1-weiyongjun1@huawei.com>
In-Reply-To: <20191008090133.9760-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 10/8/19 6:01 AM, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: f13d5f361959 ("media: vimc: Collapse component structure into a single monolithic driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thank you
Helen

> ---
>  drivers/media/platform/vimc/vimc-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 6e3e5c91ae39..2d20a7c10398 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -202,8 +202,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
>  				       sizeof(*vimc->ent_devs),
>  				       GFP_KERNEL);
> -	if (!vimc->ent_devs)
> +	if (!vimc->ent_devs) {
> +		ret = -ENOMEM;
>  		goto err_v4l2_unregister;
> +	}
>  
>  	/* Invoke entity config hooks to initialize and register subdevs */
>  	ret = vimc_add_subdevs(vimc);
> 
> 
> 
