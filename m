From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 02 Jun 2007 18:00:07 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <200706022000.07655.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>   some thoughts on how much of the "#if 0" stuff can be removed.
> first, in a lot of cases, there's little you can do.  there will be
> some code that has been commented out, with no indication as to why
> that was done.
ok, now I'm cautious with my comments because the discussion became
quite emotional (the change of views between Matthew and you). However,
I think that if there's no indication why the code was commented out and
if even the maintainer doesn't know why, I think it is quite clear that the
affected lines should be removed, because the collective memory of the
community has forgotten why it was done. If nobody knows it, I think that
nobody will ever use this code again.

> if you're lucky, you might be able to recognize that 
> the "removed" code represents a clearly deprecated or obsolete kernel
> construct, in which case you can certainly take a shot at putting
> together a patch and just emailing it offline to the respective
> subsystem maintainer.
>   i've had good luck with that -- if you're not sure about the patch,
> there's no point posting it to the whole list, just send it to the
> maintainer and ask for some feedback.  in some cases, they'll just
> add it to their local tree and you're done.
The next time I encounter lines commented out with #if 0 and I detect something
like that, I'll follow your advice.
 
>   in other cases, there's obviously something weird going on and, if
> you want to follow up, you might need to do some detective work.  
<snip>
> in cases like that, a short email to one of the 
> maintainers might clear things up.
ok.

>   there's no one formula for this sort of cleanup, and it's typically
> compounded by the fact that developers are outrageously possessive of
> their code, even if it's years old and rotting.  best advice:  just
> start perusing and pick something that looks obvious.
ok.

	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
