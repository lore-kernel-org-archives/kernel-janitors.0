From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sat, 20 Nov 2010 09:00:59 +0000
Subject: Re: [PATCH] drivers: base: core: do not put noninitialized devices
Message-Id: <20101120090058.GA4263@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290192100-11451-1-git-send-email-segoon@openwall.com>
 <20101119190242.GA14328@suse.de>
 <20101119191424.GA12273@albatros>
 <20101119205709.GA17531@suse.de>
In-Reply-To: <20101119205709.GA17531@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 19, 2010 at 12:57 -0800, Greg KH wrote:
> On Fri, Nov 19, 2010 at 10:14:25PM +0300, Vasiliy Kulikov wrote:
> > kobject_put() calls WARN if state_initialized = 0:
> > 
> >     void kobject_put(struct kobject *kobj)
> >     {
> >         if (kobj) {
> >             if (!kobj->state_initialized)
> >                 WARN(1, KERN_WARNING "kobject: '%s' (%p): is not "
> >                        "initialized, yet kobject_put() is being "
> >                        "called.\n", kobject_name(kobj), kobj);
> > 
> > 
> > I got the stack dump with similar code:
> > 
> >     struct device *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >     put_device(dev);
> 
> Sure, that's illegal code,

You might misunderstood me, see this part of device_create_vargs():

struct device *device_create_vargs(...)
{
    ...
	dev = kzalloc(sizeof(*dev), GFP_KERNEL); <<<
	if (!dev)
        ...

	dev->devt = devt;
	dev->class = class;
	dev->parent = parent;
	dev->release = device_create_release;
	dev_set_drvdata(dev, drvdata);

	retval = kobject_set_name_vargs(&dev->kobj, fmt, args); <<<
	if (retval)
		goto error; <<<
    ...

error:
	put_device(dev); <<<
    ...
}

It is device_create_vargs()'s mistake, not the caller.

> and we want to warn about that.  So I would
> say, if an error happens, we want to see this message so the code should
> stay as-is.

If you mean "if memomy allocation for name fails then we want to see
message about allocation failure" then maybe use pr_err("No mem for device
name\n") instead of confusing "kobject is not initialized, yet kobject_put()
is being called"?


Thanks,

-- 
Vasiliy Kulikov
http://www.openwall.com - bringing security into open computing environments
