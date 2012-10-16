From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 08:11:36 +0000
Subject: Re: [stericsson:very-early-printk 1/1] (.text+0x8282): undefined reference to `printascii'
Message-Id: <20121016081136.GA7804@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121016033038.GA18883@localhost>
In-Reply-To: <20121016033038.GA18883@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 16, 2012 at 10:06:02AM +0200, Linus Walleij wrote:
> On Tue, Oct 16, 2012 at 5:30 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > FYI, kernel build failed on
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git very-early-printk
> > head:   fe365f8d14989c7679a97a88a6aac7fd48ed744d
> > commit: fe365f8d14989c7679a97a88a6aac7fd48ed744d [1/1] very early printk
> > config: x86_64-allmodconfig # make ARCH=x86_64 allmodconfig
> >
> > All error/warnings:
> >
> > kernel/built-in.o: In function `vprintk_emit':
> > (.text+0x8282): undefined reference to `printascii'
> 
> Hey :-)

Hi Linus!

> You're build testing all my funny branches, how come?

Yes, all branches will be tested by default, how you may tell me to
opt-out some of them.

> Are you doing this all over kernel.org?

Yes, I'm trying to cover kind of all trees get pulled from Linus and
his maintainers.

Thanks,
Fengguang
