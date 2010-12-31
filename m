From: Mike Galbraith <efault@gmx.de>
Date: Fri, 31 Dec 2010 10:04:19 +0000
Subject: Re: [PATCH] sched, cgroup: Use exit hook to avoid use-after-free
Message-Id: <1293789859.6839.97.camel@marge.simson.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293106330.2170.618.camel@laptop>
	 <1293107624.2170.642.camel@laptop> <1293128670.2170.748.camel@laptop>
	 <1293132304.6798.6.camel@marge.simson.net>
	 <1293132862.25981.22.camel@laptop>
	 <1293187425.7138.2.camel@marge.simson.net>
	 <1293188091.25981.200.camel@laptop>
	 <1293192999.18035.4.camel@marge.simson.net>
	 <1293206353.29444.205.camel@laptop> <20101229152522.GA23825@elte.hu>
	 <20101229230744.GA10557@genesis.frugalware.org>
In-Reply-To: <20101229230744.GA10557@genesis.frugalware.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Vajna <vmiklos@frugalware.org>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, Paul Turner <pjt@google.com>, Yong Zhang <yong.zhang0@gmail.com>, Li Zefan <lizf@cn.fujitsu.com>, Paul Menage <menage@google.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, Srivatsa Vaddagiri <vatsa@in.ibm.com>

On Thu, 2010-12-30 at 00:07 +0100, Miklos Vajna wrote:
> On Wed, Dec 29, 2010 at 04:25:22PM +0100, Ingo Molnar <mingo@elte.hu> wrote:
> > I tried this patch, but it causes a boot crash:
> 
> Hm, indeed. (I get a crash in qemu, but not on the host machine.)
> 
> qemu -enable-kvm -kernel kernel-build/arch/x86/boot/bzImage  -append "root=/dev/sda1 debug sched_debug ignore_loglevel sysrq_always_enabled console=ttyS0 init=/bin/systemd" -hda systemd.img -serial stdio -m 1G -vnc :0
> 
> does not crash here, but
> 
> qemu -enable-kvm -kernel kernel-build/arch/x86/boot/bzImage  -append "root=/dev/sda1 debug sched_debug ignore_loglevel sysrq_always_enabled console=ttyS0" -hda systemd.img -serial stdio -m 1G -vnc :0
> 
> does.
> 
> I'm attaching the config (what I already sent earlier in this thread)
> and the output of the above two commands just in case that helps Peter.

Your crash seems to be completely independent of Peter's patch.  It
crashes here with your image/config/2.6.36 here regardless, and not 100%
repeatably.  Sometimes it boots, sometimes not.

	-Mike


