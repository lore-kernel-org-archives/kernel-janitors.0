From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 22 Dec 2010 17:08:38 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1293037718.2170.155.camel@laptop>
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
> kernel-build is a git build using the config I already sent and after a
> 'git checkout v2.6.36'. I can try to build master as well, so far what I
> saw is that the bug occurs there as well, but less frequently, so maybe
> that's a bit harder to debug. 

Right, so I've got v2.6.36 exploding, current -git and -tip won't
explode for me, tried both about 20 times. So I'll try and figure out
wth makes .36 explode and then see if further kernel still suffer that
problem.


