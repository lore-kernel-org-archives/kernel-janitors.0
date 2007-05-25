From: Cripps <acripps@gmail.com>
Date: Fri, 25 May 2007 11:20:52 +0000
Subject: Re: [KJ] looking for a project? (ARRAY_SIZE)
Message-Id: <c6711b6b0705250420k3d73ef0dhaf1924bc3d1b2cfc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> ok, i've updated the wiki page for the ARRAY_SIZE stuff:
>
>   http://fsdev.net/wiki/index.php?title=ARRAY_SIZE
>
> to get started, i suggest you pick a small subsystem, do the cleanup
> there, submit the resulting patch to this list, and we'll let you know
> if it was done properly.  in short order, we should converge on the
> right solution and you can start doing all the rest of them.
>
> rday
>
> p.s.  feel free to edit the wiki page to make it clearer, or suggest
> improvements.
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ====================================

Okay, thanks Robert.
I'll start on the linux-2.6/drivers/net subsystem for now, so someone
else can work on another part of the drivers if desired. There's about
18 results when doing:

grep -r "sizeof.*/.*sizeof" /path/to/kernel/source/drivers/net/

and I got a total of about 129 lines for the whole kernel source tree,
based on the git sources from Linus' tree yesterday. You're right ...
plenty of work to do :)
So, I might get started on that later today, else, I'll get a start on
it tomorrow.

-Aaron Cripps

P.S. is there a spot in the wiki pages/wherever that we would mention
that *this part* of the project is being worked on, just so that
multiple people aren't writing patches for this stuff?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
