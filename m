From: Hans de Goede <hdegoede@redhat.com>
Date: Sun, 24 Jul 2011 15:22:39 +0000
Subject: Re: [patch] [media] pwc: precedence bug in pwc_init_controls()
Message-Id: <4E2C38BF.80901@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110723185303.GA3711@shale.localdomain>
In-Reply-To: <20110723185303.GA3711@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>, =?ISO-8859-1?Q?Jean-Fran=E7ois_Moine?= <moinejf@free.fr>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

Thanks I've added your patch to my gspca/pwc tree and
send an updated pull request to Mauro including your patch.

Regards,

Hans


On 07/23/2011 08:53 PM, Dan Carpenter wrote:
> '!' has higher precedence than'&' so we need parenthesis here.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
>
> diff --git a/drivers/media/video/pwc/pwc-v4l.c b/drivers/media/video/pwc/pwc-v4l.c
> index e9a0e94..8c70e64 100644
> --- a/drivers/media/video/pwc/pwc-v4l.c
> +++ b/drivers/media/video/pwc/pwc-v4l.c
> @@ -338,7 +338,7 @@ int pwc_init_controls(struct pwc_device *pdev)
>   	if (pdev->restore_factory)
>   		pdev->restore_factory->flags = V4L2_CTRL_FLAG_UPDATE;
>
> -	if (!pdev->features&  FEATURE_MOTOR_PANTILT)
> +	if (!(pdev->features&  FEATURE_MOTOR_PANTILT))
>   		return hdl->error;
>
>   	/* Motor pan / tilt / reset */
