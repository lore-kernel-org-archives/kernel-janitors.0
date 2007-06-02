From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 02 Jun 2007 18:31:08 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <200706022031.08856.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<snip>
> > Unless you're willing to go through each one, and figure out whether
> > it's still useful or not for anyone reading this section of code
> > later, it's better to leave it alone.
> 
> it's not clear that andi was suggesting a single, sweeping deletion
> operation (which *would* be a bad idea).  when i read his post, *i*
> interpreted it as suggesting that a gradual examination might be in
> order, and stuff that was clearly worthless could be removed bit by
> bit.
<snip>
To clarify that affair: No, I didn't want to write a big patch that removes
those lines. I just aked for a reason why those lines should be kept in
the tree. Even if I had not asked why, I wouldn't have written such a patch.
Instead I would have inspected these lines in detail (which is btw what I'm
going to do whenever I encounter such lines in the future).
Perhaps I picked up the wrong list. Maybe I should have asked that on
the kernel-newbie mailing list.

I'm sorry this conversation got that emotional. I didn't want to bring you
to that point (please remember: it was just a *question*).

	Cheers,
		Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
