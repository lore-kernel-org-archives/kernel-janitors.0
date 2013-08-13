From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 13 Aug 2013 07:31:29 +0000
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
Message-Id: <5209E0D1.6000501@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094904.GC29282@elgon.mountain>
 <5209D0C6.5070307@freescale.com> <20130813063533.GP5502@mwanda>
In-Reply-To: <20130813063533.GP5502@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>, Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On 08/12/2013 11:35 PM, Dan Carpenter wrote:
> On Tue, Aug 13, 2013 at 02:23:02PM +0800, Huang Shijie wrote:
>> 于 2013年08月09日 17:49, Dan Carpenter 写道:
>>> There are static checkers which complain when we declare variables as
>>
>> could you tell me which "checker" and how do you test it?
>>
>> you'd better post the warning message here.
>>
>
> It's some stuff I'm working on but haven't released yet.  But "len"

Which static checker isn't all that important, so no worries. The patch 
can stand on its own merits.

> and "ofs" are declared as u64 and loff_t.  If they were declared as
> unsigned long then maybe the current code would be fine because the
> code would be correct-ish on 32 bit arches.

IIUC, it's still correct, since we surely will never have an eraseblock 
size near 4GB (i.e., if the shift is ever larger than 31, we have a bug 
somewhere else).

> So this is definitely the right thing to do.

As far as types are concerned, yes, this is still the right thing to do.

Brian
