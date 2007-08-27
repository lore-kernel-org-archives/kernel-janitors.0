From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 27 Aug 2007 12:37:28 +0000
Subject: Re: possible power-of-2 cleanup
Message-Id: <Pine.LNX.4.64.0708270830560.31657@localhost.localdomain>
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

by the way, in some places, there is just some really weird sh*t going
on.  like here, in fs/hfs/mdb.c:

        /* size must be a multiple of 512 */
        while (size & (size - 1))
                size -= HFS_SECTOR_SIZE;

now, it turns out that HFS_SECTOR_SIZE is defined as 512, but i'm
baffled as to how continually *subtracting* 512 is going to end up
giving you a *multiple* of 512.

in general, i would be intensely suspicious of any loop that iterates
*until* something is a power of 2 -- that's probably something that
can be simplified.  some of those cases are screamingly obvious, like
this from drivers/md/dm-snap.c:

/*
 * Rounds a number down to a power of 2.
 */
static uint32_t round_down(uint32_t n)
{
        while (n & (n - 1))
                n &= (n - 1);
        return n;
}

  anyway, you get the idea.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
