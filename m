From: Ingo Molnar <mingo@kernel.org>
Date: Sun, 12 Apr 2015 09:38:42 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150412093842.GA18122@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I used to use out: and err: labels but for the past few years my job 
> has been to look at error handling every day.  I now believe very 
> strongly that do-nothing gotos are harmful.  It's going to be my 
> contribution to computer engineering to persuade people to hate exit 
> labels.

So I ended up cleaning up that function myself:

static int __init pt_pmu_hw_init(void)
{
	struct dev_ext_attribute *de_attrs;
	struct attribute **attrs;
	size_t size;
	int ret;
	long i;

	attrs = NULL;
	ret = -ENODEV;
	if (!test_cpu_cap(&boot_cpu_data, X86_FEATURE_INTEL_PT))
		goto fail;

	for (i = 0; i < PT_CPUID_LEAVES; i++) {
		cpuid_count(20, i,
			    &pt_pmu.caps[CR_EAX + i*4],
			    &pt_pmu.caps[CR_EBX + i*4],
			    &pt_pmu.caps[CR_ECX + i*4],
			    &pt_pmu.caps[CR_EDX + i*4]);
	}

	ret = -ENOMEM;
	size = sizeof(struct attribute *) * (ARRAY_SIZE(pt_caps)+1);
	attrs = kzalloc(size, GFP_KERNEL);
	if (!attrs)
		goto fail;

	size = sizeof(struct dev_ext_attribute) * (ARRAY_SIZE(pt_caps)+1);
	de_attrs = kzalloc(size, GFP_KERNEL);
	if (!de_attrs)
		goto fail;

	for (i = 0; i < ARRAY_SIZE(pt_caps); i++) {
		struct dev_ext_attribute *de_attr = de_attrs + i;

		de_attr->attr.attr.name = pt_caps[i].name;

		sysfs_attr_init(&de_attrs->attr.attr);

		de_attr->attr.attr.mode		= S_IRUGO;
		de_attr->attr.show		= pt_cap_show;
		de_attr->var			= (void *)i;

		attrs[i] = &de_attr->attr.attr;
	}

	pt_cap_group.attrs = attrs;

	return 0;

fail:
	kfree(attrs);

	return ret;
}

Note the fundamentally robust failure handling logic: all places can 
do a 'goto fail' and it will just clean itself up. Since this is init 
code, the kfree(NULL) is a non-issue.

Should this be extended in the future, the 'fail' path can be extended 
indefinitely to clean up other resources as well.

Let me react to your list of concerns:

> https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ
> 
> 1) "goto err;" is annoying to read because the name is meaningless.

Agreed, 'goto fail' is more meaningful.

> 2) Exit labels bad associations because code which uses err: or out:
>    labels is often buggy as we have seen in pt_event_add().

Not if the cleanup path is robustly constructed. Multiple labels can 
also be used:

  - if performance is of concern
  - if we need to unroll layers of taken locks

> 3) They don't do anything for return in the middle bugs. [...]

Of course they do: if the standard pattern is to use goto labels then 
a stray 'return' sticks out like a sore thumb.

>                                                    [...]  They only
>    discourage people from returning at the start of the function where
>    direct returns are fine.

I disagree - I always notice middle returns during review.

>    In theory, one place where they might be useful is if we added
>    locking to a function later on.  First of all, when we add locking no
>    one ever changes the out: label to out_unlock:.  It never happens.

I frequently do that in code I maintain, but if it's missing anywhere 
I'll take patches gladly - control flow readability, especially as it 
relates to exception/error handling, is one of my pet peeves.

>    Also missing unlocks on error paths is sort of a sloppy/newbie
>    mistake.  I have looked through the git log and newbies are just as
>    likely to get locking wrong when there is an exit label as when there
>    is not.
> 
>    https://plus.google.com/106378716002406849458/posts/DfuAkt8szf2

The main point isn't to discourage newbies from making newbie 
mistakes.

The point is to make code more naturally readable/maintainable and 
extensible in the long run.

> 4) Exit labels introduce a whole new class of "forgot to set the error
>    code" bugs which don't happen with direct returns.

Well, that's not really a concern as long as you use robust 
techniques:

 - initialize the return code before any attempt that might fail.
 - update the return code accordingly

The worst that can happen in that case is to return say -ENODEV 
instead of -ENOMEM which isn't a serious bug in any case, and it 
typically sticks out during review as well.

Plus what you have not considered, direct returns may have some code 
generation costs as well.

For example branch predictions: forward labels are more likely to 
result in default-untaken forward branches - while direct returns are 
more likely to result in a RET instruction which is suboptimal.

( Which is obviously not a concern in init code - but it's of 
  relevence in hotter codepaths. )

Thanks,

	Ingo
