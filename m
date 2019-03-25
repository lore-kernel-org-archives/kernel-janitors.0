From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 25 Mar 2019 10:08:12 +0000
Subject: Re: [PATCH] media: v4l2-ctrl: potential shift wrapping bugs
Message-Id: <20190325100812.y64uflgitooe7pqm@kekkonen.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325090626.GC16023@kadam>
In-Reply-To: <20190325090626.GC16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Tomasz Figa <tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Keiichi Watanabe <keiichiw@chromium.org>, Smitha T Murthy <smitha.t@samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Mon, Mar 25, 2019 at 12:06:26PM +0300, Dan Carpenter wrote:
> This code generates a static checker warning:
> 
>     drivers/media/v4l2-core/v4l2-ctrls.c:2921 v4l2_querymenu()
>     warn: should '(1 << i)' be a 64 bit type?
> 
> The problem is that "ctrl->menu_skip_mask" is a u64 and we're only
> testing the lower 32 bits.

This seems to be caused by patch 0ba2aeb6dab8 ("[media] v4l2-ctrls:
increase internal min/max/step/def to 64 bit"). Backporting the fix isn't
likely really important --- the reason being no-one has figured this out
previously, very probably so because there are no menus that long.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index b79d3bbd8350..cee78485df02 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1599,7 +1599,7 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_INTEGER_MENU:
>  		if (ptr.p_s32[idx] < ctrl->minimum || ptr.p_s32[idx] > ctrl->maximum)
>  			return -ERANGE;
> -		if (ctrl->menu_skip_mask & (1 << ptr.p_s32[idx]))
> +		if (ctrl->menu_skip_mask & (1ULL << ptr.p_s32[idx]))
>  			return -EINVAL;
>  		if (ctrl->type = V4L2_CTRL_TYPE_MENU &&
>  		    ctrl->qmenu[ptr.p_s32[idx]][0] = '\0')
> @@ -2918,7 +2918,7 @@ int v4l2_querymenu(struct v4l2_ctrl_handler *hdl, struct v4l2_querymenu *qm)
>  		return -EINVAL;
>  
>  	/* Use mask to see if this menu item should be skipped */
> -	if (ctrl->menu_skip_mask & (1 << i))
> +	if (ctrl->menu_skip_mask & (1ULL << i))
>  		return -EINVAL;
>  	/* Empty menu items should also be skipped */
>  	if (ctrl->type = V4L2_CTRL_TYPE_MENU) {

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
