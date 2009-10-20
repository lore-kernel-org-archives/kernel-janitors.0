From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 20 Oct 2009 06:48:45 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091020064845.GI29158@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 19, 2009 at 11:08:41PM +0200, "L. Alberto Gim??nez" wrote:
> I'm starting to do some cleanup for the project, and I'd like to begin
> fixing sparse errors.

Fixing sparse errors is a worthy place to start; it's certainly more
useful than doing checkpatch warning fixes.

> By the way, at first glance, it seems that the warnings that sparse
> catches may need some depth look (i.e. not a newbiew) not to mess things.

There's certainly a matter of style and taste when deciding how to fix
a warning ... if it were automatable, we could automate the fixes ;-)

> For example, my first compilation sparse checking throws this:
> 
> init/main.c:763:13: warning: symbol 'call' shadows an earlier one
> init/main.c:710:31: originally declared here
> init/main.c:793:13: warning: symbol 'call' shadows an earlier one
> init/main.c:710:31: originally declared here
> 
> If you take a look at the code, the global "call" variable is defined as:
> 
> static struct boot_trace_call call;
> 
> And what makes sparse whine is a local variable definition, totally
> unrelated (i think):
> 
> static void __init do_initcalls(void)
> {
>     initcall_t *call;
> 
>     for (call = __early_initcall_end; call < __initcall_end; call++)
>         do_one_initcall(*call);
> 
>     /* Make sure there is no pending stuff from the initcall sequence */
>     flush_scheduled_work();
> }
> 
> So, it seems that I could "fix" this by changing the local variable
> name. The question is: is this _really_ needed apart from "code
> hygiene"? Should I "fix" (if you agree to call that "to fix") that issue?

It can certainly be confusing to have two variables with the same name.
Since gcc can do this, I'm not sure why we don't enable -Wshadow.

I think in this particular case, there's no reason for 'boot_trace_call'
to have file-level scope.  I would move it inside the do_one_initcall()
function (and I'd do the same with msgbuf and boot_trace_ret too).

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
