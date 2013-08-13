From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Aug 2013 06:35:33 +0000
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
Message-Id: <20130813063533.GP5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094904.GC29282@elgon.mountain>
 <5209D0C6.5070307@freescale.com>
In-Reply-To: <5209D0C6.5070307@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Huang Shijie <b32955@freescale.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Tue, Aug 13, 2013 at 02:23:02PM +0800, Huang Shijie wrote:
> 于 2013年08月09日 17:49, Dan Carpenter 写道:
> >There are static checkers which complain when we declare variables as
> 
> could you tell me which "checker" and how do you test it?
> 
> you'd better post the warning message here.
> 

It's some stuff I'm working on but haven't released yet.  But "len"
and "ofs" are declared as u64 and loff_t.  If they were declared as
unsigned long then maybe the current code would be fine because the
code would be correct-ish on 32 bit arches.

So this is definitely the right thing to do.

regards,
dan carpenter

