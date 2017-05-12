From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 May 2017 07:09:09 +0000
Subject: Re: [PATCH 2/4] vmbus: Delete an error message for a failed memory allocation in vmbus_device_create
Message-Id: <20170512070909.xxa62d2cde3qoj4f@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
 <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
 <20170511093015.4cdfdb6c@xeon-e3>
In-Reply-To: <20170511093015.4cdfdb6c@xeon-e3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Stephen Hemminger <sthemmin@microsoft.com>, Wolfram Sang <wsa@the-dreams.de>, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@linuxdriverproject.org

On Thu, May 11, 2017 at 09:30:15AM -0700, Stephen Hemminger wrote:
> > diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> > index 6802d74f162c..96328aebae5a 100644
> > --- a/drivers/hv/vmbus_drv.c
> > +++ b/drivers/hv/vmbus_drv.c
> > @@ -1149,7 +1149,5 @@ struct hv_device *vmbus_device_create(const uuid_le *type,
> > -	if (!child_device_obj) {
> > -		pr_err("Unable to allocate device object for child device\n");
> > +	if (!child_device_obj)
> >  		return NULL;
> > -	}
> >  
> >  	child_device_obj->channel = channel;
> >  	memcpy(&child_device_obj->dev_type, type, sizeof(uuid_le));
> 
> Taking out the message assumes that all callers of this function either log an
> error or pass appropriate error code back to userspace. Did you walk back
> through all the callers?
> 
> Just because an automated tool says that this needs to change does not
> mean it has to.

Checkpatch.pl is correct here.  This message is useless.  It's during
init so it's unlikely to fail ever.  In current kernels small kmallocs
are quaranteed to succeed so it can't actually fail currently.  The
stack trace is more useful than this message because it tells you a lot
about what memory is free and the whole call tree.

The error message is dead useless code.

This patch is not going to be merged because Markus doesn't listen to
feedback and he's blocked but otherwise it's an OK patch.

regards,
dan carpenter

