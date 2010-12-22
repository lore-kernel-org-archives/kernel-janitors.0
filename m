From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 22 Dec 2010 15:25:30 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1293031530.2170.150.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	 <1277808215.1868.5.camel@laptop>
	 <20101219020313.GJ31750@genesis.frugalware.org>
	 <20101222002248.GP10557@genesis.frugalware.org>
	 <1293006589.2170.41.camel@laptop>
	 <1293007311.11370.172.camel@marge.simson.net>
	 <1293008842.2170.70.camel@laptop>
	 <20101222133154.GS10557@genesis.frugalware.org>
	 <1293026422.2170.136.camel@laptop> <1293027112.2170.140.camel@laptop>
	 <20101222151434.GW10557@genesis.frugalware.org>
In-Reply-To: <20101222151434.GW10557@genesis.frugalware.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Vajna <vmiklos@frugalware.org>
Cc: Mike Galbraith <efault@gmx.de>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

On Wed, 2010-12-22 at 16:14 +0100, Miklos Vajna wrote:
> 
> qemu -enable-kvm -kernel kernel-build/arch/x86/boot/bzImage -append
> "root=/dev/sda1 debug sched_debug ignore_loglevel sysrq_always_enabled
> console=ttyS0 init=/bin/systemd" -hda systemd.img -serial stdio -m 1G
> -vnc :0
> 
> ^ Only init=/bin/systemd added, and this results in a panic in most
> cases. I'm attaching the stdout of qemu, showing the fail in
> put_prev_task_fair. 

OK, that does seem to work, maybe it really wants the vnc thing, dunno.

Anyway, it looks like I need to go build a kernel with kvm in for that
machine ;-) Thanks for the effort so far.
