From: Jessica Yu <jeyu@kernel.org>
Date: Thu, 19 Oct 2017 11:02:46 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <20171019110246.7f5m5ossvq5c5jz7@redbean>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019092943.hbghcaifwkcdsgd3@redbean>
 <20171019103034.kw6lthwq22vafqjx@mwanda>
In-Reply-To: <20171019103034.kw6lthwq22vafqjx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

+++ Dan Carpenter [19/10/17 13:30 +0300]:
>On Thu, Oct 19, 2017 at 11:29:43AM +0200, Jessica Yu wrote:
>> +++ SF Markus Elfring [06/10/17 17:12 +0200]:
>> > From: Markus Elfring <elfring@users.sourceforge.net>
>> > Date: Fri, 6 Oct 2017 16:27:26 +0200
>> >
>> > Omit an extra message for a memory allocation failure in this function.
>> >
>> > This issue was detected by using the Coccinelle software.
>> >
>> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> > ---
>> > kernel/module.c | 4 +---
>> > 1 file changed, 1 insertion(+), 3 deletions(-)
>> >
>> > diff --git a/kernel/module.c b/kernel/module.c
>> > index de66ec825992..07ef44767245 100644
>> > --- a/kernel/module.c
>> > +++ b/kernel/module.c
>> > @@ -837,10 +837,8 @@ static int add_module_usage(struct module *a, struct module *b)
>> >
>> > 	pr_debug("Allocating new usage for %s.\n", a->name);
>> > 	use = kmalloc(sizeof(*use), GFP_ATOMIC);
>> > -	if (!use) {
>> > -		pr_warn("%s: out of memory loading\n", a->name);
>> > +	if (!use)
>> > 		return -ENOMEM;
>> > -	}
>>
>> IMO this is removing useful information. Although stack traces are
>> generated on alloc failures, the extra print also tells us which
>> module we were trying to load at the time the memory allocation
>> failed.
>
>This is a small allocation so it can't fail in current kernels.  I can't
>imagine a situation where this could fail and it wasn't dead easy to
>debug.  Most modules are loaded at boot so it's not likely to fail, but
>if it did, it would be easy to reproduce.  If it's not loaded at boot
>it's probably really easy to tell which module we're loading.

Yeah, good points. And on second thought, we normally don't print
warnings for every small alloc failure in the kernel anyway (that
would be utterly superfluous), the error code itself is sufficient.
And in the module loader this seems to be the only printk out of the
dozen alloc calls we do, so I'm OK with removing this one.

Thanks,

Jessica
