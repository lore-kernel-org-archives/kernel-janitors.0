From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 21 Sep 2012 12:38:19 +0000
Subject: Re: [signal:master 94/94] kernel/signal.c:3119:35: error: expected identifier before '(' token
Message-Id: <20120921123819.GJ13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921071926.GA1253@localhost>
In-Reply-To: <20120921071926.GA1253@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2012 at 03:19:26PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
> head:   1320d2cc9be60744e2e0bbb73f8e2653a77bf59c
> commit: 1320d2cc9be60744e2e0bbb73f8e2653a77bf59c [94/94] mips: sigaltstack conversion
> config: mips-allnoconfig
> 
> All related error/warning messages:
> 
> kernel/signal.c: In function 'sys_sigaltstack':
> kernel/signal.c:3119:35: error: expected identifier before '(' token
> kernel/signal.c:3120:1: warning: control reaches end of non-void function [-Wreturn-type]

D'oh...  broken user_stack_pointer() definition -
#define foo(regs) ((regs)->regs[something])
is a bad idea...  Fixed.
