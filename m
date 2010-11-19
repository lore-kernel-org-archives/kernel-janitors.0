From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 19:14:25 +0000
Subject: Re: [PATCH] drivers: base: core: do not put noninitialized devices
Message-Id: <20101119191424.GA12273@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290192100-11451-1-git-send-email-segoon@openwall.com>
 <20101119190242.GA14328@suse.de>
In-Reply-To: <20101119190242.GA14328@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Greg,

On Fri, Nov 19, 2010 at 11:02 -0800, Greg KH wrote:
> On Fri, Nov 19, 2010 at 09:41:40PM +0300, Vasiliy Kulikov wrote:
> > If kobject_set_name_vargs() fails then put_device() frees
> > device with zero kobj->state_initialized.  This leads to WARN().
> 
> Have you seen this happen?

No, I've just analized the code.  Without device_initialize() ->kobj is
not initialized:

	kobject_init(&dev->kobj, &device_ktype) calls

	kobject_init_internal(kobj) calls

	kobj->state_initialized = 1;

kobject_put() calls WARN if state_initialized = 0:

    void kobject_put(struct kobject *kobj)
    {
        if (kobj) {
            if (!kobj->state_initialized)
                WARN(1, KERN_WARNING "kobject: '%s' (%p): is not "
                       "initialized, yet kobject_put() is being "
                       "called.\n", kobject_name(kobj), kobj);


I got the stack dump with similar code:

    struct device *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
    put_device(dev);

> I'd prefer not to change this unless you are seeing problems with the
> current code.
> 
> How did kobject_set_name_vargs() fail for you?

int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
				  va_list vargs)
{
    [...]
	kobj->name = kvasprintf(GFP_KERNEL, fmt, vargs);
	if (!kobj->name)
		return -ENOMEM;


char *kvasprintf(gfp_t gfp, const char *fmt, va_list ap)
{
    [...]
	p = kmalloc(len+1, gfp);
	if (!p)
		return NULL;

Unlikely, but may fail in OOM situation.


Thanks,

-- 
Vasiliy Kulikov
http://www.openwall.com - bringing security into open computing environments
