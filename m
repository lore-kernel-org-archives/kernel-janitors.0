From: Greg KH <greg@kroah.com>
Date: Thu, 11 May 2017 17:47:54 +0000
Subject: Re: [PATCH 1/4] vmbus: Improve a size determination in vmbus_device_create()
Message-Id: <20170511174754.GA23371@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
 <22c8886f-a38c-23ab-9277-ccccf86b1801@users.sourceforge.net>
 <20170511093056.036d93b6@xeon-e3>
In-Reply-To: <20170511093056.036d93b6@xeon-e3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@linuxdriverproject.org

On Thu, May 11, 2017 at 09:30:56AM -0700, Stephen Hemminger wrote:
> On Thu, 11 May 2017 18:15:46 +0200
> SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 11 May 2017 17:30:10 +0200
> > 
> > Replace the specification of a data structure by a pointer dereference
> > as the parameter for the operator "sizeof" to make the corresponding size
> > determination a bit safer according to the Linux coding style convention.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/hv/vmbus_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> > index 0087b49095eb..6802d74f162c 100644
> > --- a/drivers/hv/vmbus_drv.c
> > +++ b/drivers/hv/vmbus_drv.c
> > @@ -1145,5 +1145,5 @@ struct hv_device *vmbus_device_create(const uuid_le *type,
> >  {
> >  	struct hv_device *child_device_obj;
> >  
> > -	child_device_obj = kzalloc(sizeof(struct hv_device), GFP_KERNEL);
> > +	child_device_obj = kzalloc(sizeof(*child_device_obj), GFP_KERNEL);
> >  	if (!child_device_obj) {
> 
> This looks fine.
> 
> Acked-by: Stephen Hemminger <stephen@networkplumber.org>

Note, I have a blacklist filter for this person for a reason, I, and
many other maintainers, just ignore them for good reason...

greg k-h
