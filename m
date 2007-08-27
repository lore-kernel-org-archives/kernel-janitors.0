From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 27 Aug 2007 12:26:44 +0000
Subject: Re: possible power-of-2 cleanup
Message-Id: <Pine.LNX.4.64.0708270822500.31099@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 27 Aug 2007, vignesh babu wrote:

> On 8/26/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> > On Sun, 26 Aug 2007, vignesh babu wrote:
> >
> > just FYI, i ran my detection script on the entire tree and came up
> > with these possibilities for power of 2 cleanup -- i'm assuming
> > you've probably seen and processed some of them.  as for the rest
> > of them, have fun.  :-)

> wow...thanks for the list...i would cleanup as many of those...will
> mail u a list of committed changes to the list and will update wiki
> with the same sometime in the next few hours...

be careful with some of them.  as i recall, there were the occasional
cases once upon a time where someone was using a construct like "tmp &
(tmp - 1)" but for some other purpose than just checking for power of
2.  so you should check the context first.

rday

p.s.  here's a grep command for tracking down potential cleanups:

grep -Er "([^\(\)]+) ?\& ?\(\1 ?- ?1\)" *


-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
