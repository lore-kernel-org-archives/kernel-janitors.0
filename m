From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 02:27:03 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/base
Message-Id: <6b4e42d10609171927m6c2b6b84qb7708cfd2149b9e7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
	 <200609172108.37707.dtor@insightbb.com>
In-Reply-To: <200609172108.37707.dtor@insightbb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dtor@insightbb.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 9/17/06, Dmitry Torokhov <dtor@insightbb.com> wrote:
> On Sunday 17 September 2006 20:53, Om Narasimhan wrote:
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 2b8755d..e08950b 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -192,7 +192,7 @@ int platform_device_add_resources(struct
> > {
> > struct resource *r;
> >
> > -r = kmalloc(sizeof(struct resource) * num, GFP_KERNEL);
> > +r = kzalloc(sizeof(struct resource) * num, GFP_KERNEL);
> > if (r) {
> > memcpy(r, res, sizeof(struct resource) * num);
> > pdev->resource = r;
>
> Just out of curiosity could you tell me what is the benefit of
> zeroing allocated memory here?
My mistake. :-D
>
> > @@ -216,7 +216,7 @@ int platform_device_add_data(struct plat
> > {
> > void *d;
> >
> > -d = kmalloc(size, GFP_KERNEL);
> > +d = kzalloc(size, GFP_KERNEL);
> > if (d) {
> > memcpy(d, data, size);
> > pdev->dev.platform_data = d;
> >
>
> And here?
Mea Culpa :-D

Thanks for the comment.
Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
