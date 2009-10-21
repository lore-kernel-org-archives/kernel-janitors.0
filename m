From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 21 Oct 2009 11:37:36 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091021113736.GB16586@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Matthew Wilcox <matthew@wil.cx> wrote:

> On Wed, Oct 21, 2009 at 12:02:17AM +0200, "L. Alberto Gim?nez" wrote:
> > Matthew Wilcox wrote:
> > > On Mon, Oct 19, 2009 at 11:08:41PM +0200, "L. Alberto Gim??nez" wrote:
> > 
> > > I think in this particular case, there's no reason for 'boot_trace_call'
> > > to have file-level scope.  I would move it inside the do_one_initcall()
> > > function (and I'd do the same with msgbuf and boot_trace_ret too).
> > 
> > Matthew, Walter, thanks for your reply.
> > 
> > The static (file-scope) variable was introduced by Ingo Molnar in commit
> > 4a683bf9.
> > 
> > It seems that originally those three static variables were local
> > variables, what turned out to cause a stack overflow. So, I think they
> > will stay just like they are right now :) (thank god we have git-blame).
> > 
> > Instead, I'll try to work on renaming the "offending" local variables
> > and cleaning file by file sparse warnings.
> 
> Ah, you're conflating two things here (and this is a subtle corner of C,
> but it's very important to understand the distinction.  I'm not quite
> sure why Ingo got it wrong ;-)
> 
> Here's the current situation:
> 
> static struct boot_trace_call call;
> int do_one_initcall(initcall_t fn)
> {
> 	...
> }
> 
> That allocates 'call' in the data segment, and gives it file scope.
> 
> 
> You thought I meant this:
> 
> int do_one_initcall(initcall_t fn)
> {
> 	struct boot_trace_call call;
> 	...
> }
> 
> That would change the scope to be function-local, and allocate 'call'
> on the stack.
> 
> 
> What I actually meant was this:
> 
> int do_one_initcall(initcall_t fn)
> {
> 	static struct boot_trace_call call;
> 	...
> }
> 
> That makes the scope function-local, but allocates 'call' from the data
> segment, not on the stack.

I made that change in 4a683bf9 intentionally. In the kernel we try to 
avoid function scope statics as much as possible:

 - Overlooking them and confusing them with local, on-stack variables is 
   very easy and we've had subtle bugs in the past due to that.

 - They end up in .data (or .bss) and to keep data storage/bloat under
   control it's best to see all globally allocated variables at file 
   scope.

 - All such variables need proper locking, as they can be re-entered 
   from multiple CPUs (while local stack variables cannot and generally 
   dont need such locking). Moving them to file scope makes sure it's 
   all visible and makes sure proper locking is done.

All in one, there's a constant trend away from statics at function 
scope. It can be done correctly but is subtly fragile for the above 
reasons.

	Ingo
