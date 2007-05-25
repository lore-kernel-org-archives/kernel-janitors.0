From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 25 May 2007 19:43:40 +0000
Subject: Re: [KJ] looking for a project?
Message-Id: <200705251943.41268.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705241934530.4351@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705241934530.4351@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

> Wow. That looks like one helluva project ... I'd like to undertake
> starting this in the drivers/ subsystem ... I can't start on it right
> now (because it's late), but I will have a few looks at it over the
> weekend.
<snip>

I just had a look on that and I found quite a lot of places that have to be 
fixed. Currently, I'm inspecting and fixing files in drivers/block, 
drivers/atm and drivers/char. I also found suspicious lines in the arch 
directory. Do you prefer to do the whole thing on your own or would you like 
me to work there, too? I don't want to duplicate work, neither grab the 
project away.

	Cheers,
		Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
