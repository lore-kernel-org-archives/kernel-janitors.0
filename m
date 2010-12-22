From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 22 Dec 2010 17:16:55 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <20101222171655.GB25611@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101219020313.GJ31750@genesis.frugalware.org>
 <20101222002248.GP10557@genesis.frugalware.org>
 <1293006589.2170.41.camel@laptop>
 <1293007311.11370.172.camel@marge.simson.net>
 <1293008842.2170.70.camel@laptop>
 <20101222133154.GS10557@genesis.frugalware.org>
 <1293026422.2170.136.camel@laptop>
 <1293027112.2170.140.camel@laptop>
 <20101222151434.GW10557@genesis.frugalware.org>
 <1293037718.2170.155.camel@laptop>
In-Reply-To: <1293037718.2170.155.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miklos Vajna <vmiklos@frugalware.org>, Mike Galbraith <efault@gmx.de>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, 2010-12-22 at 16:14 +0100, Miklos Vajna wrote:
> > kernel-build is a git build using the config I already sent and after a
> > 'git checkout v2.6.36'. I can try to build master as well, so far what I
> > saw is that the bug occurs there as well, but less frequently, so maybe
> > that's a bit harder to debug. 
> 
> Right, so I've got v2.6.36 exploding, current -git and -tip won't
> explode for me, tried both about 20 times. So I'll try and figure out
> wth makes .36 explode and then see if further kernel still suffer that
> problem.

Does it explode if you change some of the CONFIG_CC flags, such as 
CONFIG_CC_OPTIMIZE_FOR_SIZE? I.e. is the crash dependent on the precise kernel image 
layout perhaps? If it's sensitive to that then this might keep you from chasing 
shadows ...

Thanks,

	Ingo
