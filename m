From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 23 Oct 2009 11:14:47 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091023111446.GA19566@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2009 at 09:59:11AM +0200, Ingo Molnar wrote:
> Warnings are not something that should be 'fixed' - they are just a sign 
> of some sort of trouble:
> 
>  1- bug/limitation in the tool (Sparse)
>  2- uncleanliness in the source code
>  3- bug in the source code
> 
> here it seems to be case #1, as file scope statics are perfectly fine, 
> even if used by a single function.

This is case #2.  We used to have:

int do_one_initcall(initcall_t fn)
{
	struct boot_trace_call call;
}

static void __init do_initcalls(void)
{
        initcall_t *call;
}

static void __init do_pre_smp_initcalls(void)
{
        initcall_t *call;
}

and you changed it so that the boot_trace_call is now file-scope.  Now
sparse rightfully warns about the shadow definitions in do_initcalls and
do_pre_smp_initcalls.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
