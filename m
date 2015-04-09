From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 12:33:36 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409123336.GZ16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 02:02:12PM +0200, Ingo Molnar wrote:
> 
> * Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > There is no need to free NULL pointers.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/arch/x86/kernel/cpu/perf_event_intel_pt.c b/arch/x86/kernel/cpu/perf_event_intel_pt.c
> > index f5a3afc..c358877 100644
> > --- a/arch/x86/kernel/cpu/perf_event_intel_pt.c
> > +++ b/arch/x86/kernel/cpu/perf_event_intel_pt.c
> > @@ -135,12 +135,12 @@ static int __init pt_pmu_hw_init(void)
> >  	size = sizeof(struct attribute *) * (ARRAY_SIZE(pt_caps) + 1);
> >  	attrs = kzalloc(size, GFP_KERNEL);
> >  	if (!attrs)
> > -		goto err_attrs;
> > +		return -ENOMEM;
> 
> Please don't put stray return statements into functions, try to keep
> to clean (and singular) goto driven exit paths.

There was one earlier already.

Also I have come to despise "err" labels.  They do one of three things:

1) Nothing.  These are a pointless interruption for people reading the
   code from top to bottom because you wonder, "How is goto err
   different from return -ENOMEM?".  You scroll down to the bottom and
   find that they are the same.  Now you have lost your place and your
   train of thought.

2) One thing.  In this case the label is poorly named, better to say
   "goto unlock".

3) Everything.  This is a leading source of error handling bugs.  It
   looks like this.

err:
	kfree(foo);
	return ret;

Later we will change it so that foo is allocated with kmemdup_user()
instead of kmalloc() so now kfree() will oops trying to free the error
pointer.  I see so many one err bugs it's not even funny.

regards,
dan carpenter

