From: Jiri Olsa <jolsa@redhat.com>
Date: Fri, 03 Aug 2012 09:05:59 +0000
Subject: Re: [perf:tmp_perf:dwarf 14/21] kernel/events/core.c:3818:3: error: implicit declaration of function
Message-Id: <20120803090558.GA937@krava.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120803003307.GA6914@localhost>
In-Reply-To: <20120803003307.GA6914@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 08:33:07AM +0800, Fengguang Wu wrote:
> Hi Jiri,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tmp_perf/dwarf
> head:   48f53d5eb51405488e42c545396fc5308346fd09
> commit: 036a086d9690fd049d2685cb299ae41875ef3389 [14/21] perf: Add ability to attach user stack dump to sample
> config: mips-fuloong2e_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/events/core.c: In function 'perf_output_sample_ustack':
> kernel/events/core.c:3818:3: error: implicit declaration of function 'user_stack_pointer' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

hum.. looks like we need another CONFIG_xxx for perf stack dump,

thanks a lot for check!
jirka
