From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 22 Dec 2010 08:41:00 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1293007260.2170.44.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	 <1277808215.1868.5.camel@laptop>
	 <20101219020313.GJ31750@genesis.frugalware.org>
	 <20101222002248.GP10557@genesis.frugalware.org>
	 <1293006589.2170.41.camel@laptop>
In-Reply-To: <1293006589.2170.41.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Vajna <vmiklos@frugalware.org>
Cc: shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

On Wed, 2010-12-22 at 09:29 +0100, Peter Zijlstra wrote:
> On Wed, 2010-12-22 at 01:22 +0100, Miklos Vajna wrote:
> > Please let me know if you need more info.
> 
> What distro are you using? it looks like systemd is involved and I'm
> actively avoiding anything using that crap. It now triggering a bug
> means I need to get myself a 32bit image using it :/
> 
> If you happen to have a qemu image that reproduces.. :-)

Removed the systemd list from CC, please don't cross post with lists
that send bounces for non-members, that's considered rude.
