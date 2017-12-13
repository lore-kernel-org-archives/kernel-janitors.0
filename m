From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Wed, 13 Dec 2017 20:46:28 +0000
Subject: Re: [PATCH][mtd-next] mtd: nand: remove redundant check of len
Message-Id: <20171213214628.1e1c1431@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171213201743.27324-1-colin.king@canonical.com>
 <20171213212425.6fe999cb@bbrezillon>
 <f0326a5b-1be8-c3be-9c42-2d3677d52239@canonical.com>
 <20171213213844.78efe253@bbrezillon>
In-Reply-To: <20171213213844.78efe253@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 13 Dec 2017 21:38:44 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Wed, 13 Dec 2017 20:30:04 +0000
> Colin Ian King <colin.king@canonical.com> wrote:
> 
> > On 13/12/17 20:24, Boris Brezillon wrote:  
> > > On Wed, 13 Dec 2017 20:17:43 +0000
> > > Colin King <colin.king@canonical.com> wrote:
> > >     
> > >> From: Colin Ian King <colin.king@canonical.com>
> > >>
> > >> The check of len being zero is redundant as it has already been
> > >> sanity checked for this value at the start of the function. Hence
> > >> it is impossible for this test to be true and so the redundant
> > >> code can be removed.    
> > > 
> > > Nope, it's not the same test, the initial test is
> > > 
> > > 	if (len && !buf)    
> > 
> > Ah, the current tip from linux-next has:
> > 
> > 1912        if (!len || !buf)
> > 1913                return -EINVAL;
> > 
> > ..so I guess that's why it got picked up by static analysis.  
> 
> Hm, that's weird, that's not what I see [1] in linux-next.

This being said, the test in nand_readid_op() is wrong [1], so maybe
this was the thing you were trying to fix.

No need to send a new patch, I'll squash the fix in the commit
introducing the function.

Thanks,

Boris

[1]http://code.bulix.org/kxivhd-240572
