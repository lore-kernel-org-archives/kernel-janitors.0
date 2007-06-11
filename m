From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 11 Jun 2007 18:51:11 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/isdn/hisax: ARRAY_SIZE instead of sizeof
Message-Id: <200706112051.12407.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706101235.09578.lists-receive@programmierforen.de> <200706111120.07730.lists-receive@programmierforen.de> <82faac5b0706110525s56bade43rb24619b54687770d@mail.gmail.com>
In-Reply-To: <82faac5b0706110525s56bade43rb24619b54687770d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, kernel-janitors@lists.osdl.org, linux-kernel <linux-kernel@vger.kernel.org>, Karsten Keil <kkeil@suse.de>

<snip>
> I think what was meant here was to remove _all_ the macros that you
> assigned to the ARRAY_SIZE() macro.
Yes, absolutely. I overlooked the 'eg.' in Jan-Benedict's post. Sorry for that.

> If you look at the two advantages replacing code with the ARRAY_SIZE()
> macro has;
> 1. More readable/consistent code.
> 2. Faster compile times, because of less macros being defined.
ack. The arguments for the consistency that I mentioned in my last post
don't hold for a solution that removes all of the macros. So I'm absolutely
fine with a new patch that removes them all.
 
	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
