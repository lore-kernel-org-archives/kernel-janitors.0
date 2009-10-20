From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 20 Oct 2009 22:24:41 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091020222440.GA9693@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 21, 2009 at 12:02:17AM +0200, "L. Alberto Gim?nez" wrote:
> Matthew Wilcox wrote:
> > On Mon, Oct 19, 2009 at 11:08:41PM +0200, "L. Alberto Gim??nez" wrote:
> 
> > I think in this particular case, there's no reason for 'boot_trace_call'
> > to have file-level scope.  I would move it inside the do_one_initcall()
> > function (and I'd do the same with msgbuf and boot_trace_ret too).
> 
> Matthew, Walter, thanks for your reply.
> 
> The static (file-scope) variable was introduced by Ingo Molnar in commit
> 4a683bf9.
> 
> It seems that originally those three static variables were local
> variables, what turned out to cause a stack overflow. So, I think they
> will stay just like they are right now :) (thank god we have git-blame).
> 
> Instead, I'll try to work on renaming the "offending" local variables
> and cleaning file by file sparse warnings.

Ah, you're conflating two things here (and this is a subtle corner of C,
but it's very important to understand the distinction.  I'm not quite
sure why Ingo got it wrong ;-)

Here's the current situation:

static struct boot_trace_call call;
int do_one_initcall(initcall_t fn)
{
	...
}

That allocates 'call' in the data segment, and gives it file scope.


You thought I meant this:

int do_one_initcall(initcall_t fn)
{
	struct boot_trace_call call;
	...
}

That would change the scope to be function-local, and allocate 'call'
on the stack.


What I actually meant was this:

int do_one_initcall(initcall_t fn)
{
	static struct boot_trace_call call;
	...
}

That makes the scope function-local, but allocates 'call' from the data
segment, not on the stack.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
