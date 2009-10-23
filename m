From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 23 Oct 2009 11:38:15 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091023113815.GF5886@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Matthew Wilcox <matthew@wil.cx> wrote:

> On Fri, Oct 23, 2009 at 09:59:11AM +0200, Ingo Molnar wrote:
> > Warnings are not something that should be 'fixed' - they are just a sign 
> > of some sort of trouble:
> > 
> >  1- bug/limitation in the tool (Sparse)
> >  2- uncleanliness in the source code
> >  3- bug in the source code
> > 
> > here it seems to be case #1, as file scope statics are perfectly fine, 
> > even if used by a single function.
> 
> This is case #2.  We used to have:
> 
> int do_one_initcall(initcall_t fn)
> {
> 	struct boot_trace_call call;
> }
> 
> static void __init do_initcalls(void)
> {
>         initcall_t *call;
> }
> 
> static void __init do_pre_smp_initcalls(void)
> {
>         initcall_t *call;
> }
> 
> and you changed it so that the boot_trace_call is now file-scope.  Now 
> sparse rightfully warns about the shadow definitions in do_initcalls 
> and do_pre_smp_initcalls.

Doh, right you are!

Unfortunately the discussion was not Cc:-ed to lkml so i couldnt review 
the original patch and i assumed it moved the static back into function 
scope.

The right fix would be to rename the variables to not be colliding. (if 
we used -Wshadow like tools/perf/ does we'd have gotten this warning 
from GCC too btw) Does the patch do that? Could we please Cc: patches to 
lkml?

Thanks,

	Ingo
