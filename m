From: Joe Perches <joe@perches.com>
Date: Sun, 24 Sep 2017 10:35:23 +0000
Subject: Re: [PATCH 1/6] [media] omap_vout: Delete an error message for a failed memory allocation in omap_vo
Message-Id: <1506249323.11186.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
         <c949fbd6-0a01-d6e7-d6f9-d55dbf5dce5e@users.sourceforge.net>
In-Reply-To: <c949fbd6-0a01-d6e7-d6f9-d55dbf5dce5e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Muralidharan Karicheri <mkaricheri@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 2017-09-24 at 12:22 +0200, SF Markus Elfring wrote:
> Omit an extra message for a memory allocation failure in this function.
[]
> diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
[]
> @@ -1948,7 +1948,5 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
> -		if (!vout) {
> -			dev_err(&pdev->dev, ": could not allocate memory\n");
> +		if (!vout)
>  			return -ENOMEM;
> -		}
>  
>  		vout->vid = k;
>  		vid_dev->vouts[k] = vout;

Use normal patch styles.
Fix your tools before you send any more patches.
