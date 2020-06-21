From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 21 Jun 2020 13:55:16 +0000
Subject: Re: [PATCH] media: media-request: Fix crash according to a failed memory allocation
Message-Id: <20200621135516.GA125094@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b39653f6-9587-4027-35ed-53d341845cb2@web.de>
In-Reply-To: <b39653f6-9587-4027-35ed-53d341845cb2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>

On Sun, Jun 21, 2020 at 02:45:10PM +0200, Markus Elfring wrote:
> > …, reorder media_request_alloc() such that …
> 
> Wording adjustments:
> …, reorder statements in the implementation of the function “media_request_alloc” so that …
> 
> 
> > … the last step thus
> 
> … the last step.
> Thus media_request_close() …
> 
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> 
> …
> > +++ b/drivers/media/mc/mc-request.c
> > @@ -296,9 +296,18 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
> >  	if (WARN_ON(!mdev->ops->req_alloc ^ !mdev->ops->req_free))
> >  		return -ENOMEM;
> >
> > +	if (mdev->ops->req_alloc)
> > +		req = mdev->ops->req_alloc(mdev);
> > +	else
> > +		req = kzalloc(sizeof(*req), GFP_KERNEL);
> 
> How do you think about to use a conditional operator?
> 
> +	req = (mdev->ops->req_alloc
> 	       ? mdev->ops->req_alloc(mdev)
> 	       : kzalloc(sizeof(*req), GFP_KERNEL));
> 
> 
> Regards,
> Markus


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
