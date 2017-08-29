From: Todor Tomov <todor.tomov@linaro.org>
Date: Tue, 29 Aug 2017 11:49:34 +0000
Subject: Re: [PATCH][media-next] media: qcom: camss: Make function vfe_set_selection static
Message-Id: <043e2533-e1fd-4823-4dc7-b21483c5f560@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170829102110.25657-1-colin.king@canonical.com>
In-Reply-To: <20170829102110.25657-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Todor Tomov <todor.tomov@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 29.08.2017 13:21, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function vfe_set_selection is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> warning: symbol 'vfe_set_selection' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you!
Acked-by: Todor Tomov <todor.tomov@linaro.org>

> ---
>  drivers/media/platform/qcom/camss-8x16/camss-vfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss-8x16/camss-vfe.c b/drivers/media/platform/qcom/camss-8x16/camss-vfe.c
> index b21b3c2dc77f..b22d2dfcd3c2 100644
> --- a/drivers/media/platform/qcom/camss-8x16/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss-8x16/camss-vfe.c
> @@ -2660,7 +2660,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
>   *
>   * Return -EINVAL or zero on success
>   */
> -int vfe_set_selection(struct v4l2_subdev *sd,
> +static int vfe_set_selection(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_pad_config *cfg,
>  			     struct v4l2_subdev_selection *sel)
>  {
> 

-- 
Best regards,
Todor Tomov
