From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 25 May 2007 10:40:19 +0000
Subject: Re: [KJ] looking for a project? (ARRAY_SIZE)
Message-Id: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 24 May 2007, Cripps wrote:

> Wow. That looks like one helluva project ... I'd like to undertake
> starting this in the drivers/ subsystem ... I can't start on it right
> now (because it's late), but I will have a few looks at it over the
> weekend.
> Can you offer me any hints for working on this?

ok, i've updated the wiki page for the ARRAY_SIZE stuff:

  http://fsdev.net/wiki/index.php?title=ARRAY_SIZE

to get started, i suggest you pick a small subsystem, do the cleanup
there, submit the resulting patch to this list, and we'll let you know
if it was done properly.  in short order, we should converge on the
right solution and you can start doing all the rest of them.

rday

p.s.  feel free to edit the wiki page to make it clearer, or suggest
improvements.
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
