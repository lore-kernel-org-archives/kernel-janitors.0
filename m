From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 23 Oct 2009 11:51:42 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091023115141.GC19566@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2009 at 01:38:15PM +0200, Ingo Molnar wrote:
> * Matthew Wilcox <matthew@wil.cx> wrote:
> > and you changed it so that the boot_trace_call is now file-scope.  Now 
> > sparse rightfully warns about the shadow definitions in do_initcalls 
> > and do_pre_smp_initcalls.
> 
> Doh, right you are!
> 
> Unfortunately the discussion was not Cc:-ed to lkml so i couldnt review 
> the original patch and i assumed it moved the static back into function 
> scope.
> 
> The right fix would be to rename the variables to not be colliding. (if 
> we used -Wshadow like tools/perf/ does we'd have gotten this warning 
> from GCC too btw) Does the patch do that? Could we please Cc: patches to 
> lkml?

There wasn't a patch ... it was a question about the right way to fix
something: http://marc.info/?l=kernel-janitors&m5598851800338&w=2

I agree with you that we should add -Wshadow to the CFLAGS, rather than
requiring sparse to find these problems.

If you're dead-set on not moving this statis variable back to
function-scope, then it needs to be renamed; and probably best to rename
all of 'msgbuf', 'call' and 'ret' to have the same prefix.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
