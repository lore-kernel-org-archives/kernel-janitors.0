From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 22 Dec 2010 14:00:22 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1293026422.2170.136.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	 <1277808215.1868.5.camel@laptop>
	 <20101219020313.GJ31750@genesis.frugalware.org>
	 <20101222002248.GP10557@genesis.frugalware.org>
	 <1293006589.2170.41.camel@laptop>
	 <1293007311.11370.172.camel@marge.simson.net>
	 <1293008842.2170.70.camel@laptop>
	 <20101222133154.GS10557@genesis.frugalware.org>
In-Reply-To: <20101222133154.GS10557@genesis.frugalware.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Vajna <vmiklos@frugalware.org>
Cc: Mike Galbraith <efault@gmx.de>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

On Wed, 2010-12-22 at 14:31 +0100, Miklos Vajna wrote:
> 
> http://frugalware.org/~vmiklos/files/systemd.img
> 
> Here is how I started it:
> 
> qemu-kvm -vnc :0 -m 1G -hda systemd.img 

awesome, thanks!

I started it with something like: 
 qemu -kernel foo-build/arch/x86/boot/bzImage -append "root=/dev/sda1
debug sched_debug ignore_loglevel sysrq_always_enabled console=ttyS0"
-hda systemd.img -serial stdio -m 1G

Where foo-build/ contains a kernel build using your .config.

I'll have a poke at it..
