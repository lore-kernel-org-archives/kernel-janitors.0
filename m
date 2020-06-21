From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 21 Jun 2020 12:45:10 +0000
Subject: Re: [PATCH] media: media-request: Fix crash according to a failed memory allocation
Message-Id: <b39653f6-9587-4027-35ed-53d341845cb2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>

> …, reorder media_request_alloc() such that …

Wording adjustments:
…, reorder statements in the implementation of the function “media_request_alloc” so that …


> … the last step thus

… the last step.
Thus media_request_close() …


Would you like to add the tag “Fixes” to the commit message?


…
> +++ b/drivers/media/mc/mc-request.c
> @@ -296,9 +296,18 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  	if (WARN_ON(!mdev->ops->req_alloc ^ !mdev->ops->req_free))
>  		return -ENOMEM;
>
> +	if (mdev->ops->req_alloc)
> +		req = mdev->ops->req_alloc(mdev);
> +	else
> +		req = kzalloc(sizeof(*req), GFP_KERNEL);

How do you think about to use a conditional operator?

+	req = (mdev->ops->req_alloc
	       ? mdev->ops->req_alloc(mdev)
	       : kzalloc(sizeof(*req), GFP_KERNEL));


Regards,
Markus
