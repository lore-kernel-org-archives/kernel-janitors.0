From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 16 Mar 2005 23:45:55 +0000
Subject: Re: [KJ] kj-devel.pl added feature
Message-Id: <4238C533.3050305@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

vicente.feito@gmail.com wrote:
> Well, I've fixed something I've broken, and now I've added checks for balanced 
> ioremap()/iounmap().
> Another thing to look up to it's pci_alloc_consistent() / 
> pci_free_consistent(), but it's hard to check, cause the parameters received 
> are changed all the time with structure members and function calls, and it's 
> hard to track in order to check the balance, something it's gonna come up 
> anytime soon I guess...
> 
> PS.This weekend Domen it's going to add this to the page, so from then I'm 
> going to start sending only the patches.

Sorry for the delay.


1.  If you're building a module, be concious that you must use the 
init mechanism, module_init() and module_exit().

"concious" should be "conscious", but I suggest just changing
"be concious" to "note", or just omit it completely.

2.  file: sound/sound_core.c

Unlocking a lock that hasn't been aquired yet(could be a false 
positive) - Line:546

s/aquired/acquired/
add a space before the "("
put Line:nnn first (this may not be feasible with multiple line 
numbers, I'll let you decide)
but this one shouldn't have been reported at all IMO

3.  Using foo[] it's recommended over *foo: saves memory references & code
s/it's/is/

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
