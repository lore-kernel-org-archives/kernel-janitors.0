From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 19:58:00 +0000
Subject: Re: [KJ] are there any issues regarding the abs() and labs() macros?
Message-Id: <Pine.LNX.4.64.0701241456110.27440@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 24 Jan 2007, Chris Miller wrote:

> I just read about a clever way to use bitwise operators to do that
> kind of work.  When I get home I'll dig it up and see if it's
> possible to implement it.
>
> It was really neat.  I'm still learning about bitwise junk, but it
> was a really slick solution (more so than the macro I read on the
> wiki).

i googled on "bitwise" "absolute" "value" and came up with numerous
hits, including this one:

  http://www.thescripts.com/forum/thread212935.html

haven't read it yet, but it looks interesting.  again, the issue might
be machine word size, but i'll know more after i finish reading it.

rday

-- 
===============================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
===============================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
