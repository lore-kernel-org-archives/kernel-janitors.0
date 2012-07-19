From: David Howells <dhowells@redhat.com>
Date: Thu, 19 Jul 2012 11:37:20 +0000
Subject: Re: [modsign:for-rusty 1/1] include/linux/moduleloader.h:48:2: error: 'mod' undeclared (first use in
Message-Id: <31265.1342697840@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120718163652.GA9580@localhost>
In-Reply-To: <20120718163652.GA9580@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> I cannot quite understand this error. The problem is that I've just
> setup the blackfin cross compile, and hence it might be an old bug, or
> even some problem in my build setup..
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git for-rusty
> head:   b64582d2ab63dabc1b2bf05143900c8b2ff4b4ee
> commit: b64582d2ab63dabc1b2bf05143900c8b2ff4b4ee [1/1] Make most arch asm/module.h files use asm-generic/module.h
> config: blackfin-BF526-EZBRD_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> In file included from arch/blackfin/kernel/module.c:9:0:
> include/linux/moduleloader.h: In function 'apply_relocate':
> include/linux/moduleloader.h:48:2: error: 'mod' undeclared (first use in this function)
> include/linux/moduleloader.h:48:2: note: each undeclared identifier is reported only once for each function it appears in

pr_err() is the problem.  If you're in a file that defines pr_fmt then it will
use that.  At the top of arch/blackfin/kernel/module.c:

	#define pr_fmt(fmt) "module %s: " fmt, mod->name

I guess you can't use pr_err() in header files.

David
