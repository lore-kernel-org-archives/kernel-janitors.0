From: Joe Perches <joe@perches.com>
Date: Sun, 10 Aug 2014 21:00:49 +0000
Subject: Re: [PATCH] staging: soc_camera.c: fixed coding style: lines over 80 char
Message-Id: <1407704449.4082.11.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407703301-2037-1-git-send-email-suman@inforcecomputing.com>
In-Reply-To: <1407703301-2037-1-git-send-email-suman@inforcecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suman Kumar <suman@inforcecomputing.com>
Cc: hverkuil@xs4all.nl, g.liakhovetski@gmx.de, m.chehab@samsung.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2014-08-11 at 02:11 +0530, Suman Kumar wrote:
>     Fixes a coding style issue of 'lines over 80 char' reported by
>     checkpatch.pl
[]
> diff --git a/drivers/media/platform/soc_camera/soc_camera.c b/drivers/media/platform/soc_camera/soc_camera.c
[]
> @@ -1430,7 +1434,7 @@ static int soc_camera_async_bound(struct v4l2_async_notifier *notifier,
>  				  struct v4l2_async_subdev *asd)
>  {
>  	struct soc_camera_async_client *sasc = container_of(notifier,
> -					struct soc_camera_async_client, notifier);
> +				    struct soc_camera_async_client, notifier);
>  	struct soc_camera_device *icd = platform_get_drvdata(sasc->pdev);

I don't easily parse the original or modified lines.

If you are really concerned abut 80 columns and readability
instead of merely quieting checkpatch, these might be better
on multiple lines like

	struct soc_camera_async_client *sasc;
	struct soc_camera_device *icd;

	sasc = container_of(notifier, struct soc_camera_async_client, notifier);
	icd = platform_get_drvdata(sasc->pdev);


