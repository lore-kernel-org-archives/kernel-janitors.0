From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 16 Aug 2013 14:55:38 +0000
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
Message-Id: <1376664938.2089.384.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094904.GC29282@elgon.mountain>
In-Reply-To: <20130809094904.GC29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>, Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, 2013-08-09 at 12:49 +0300, Dan Carpenter wrote:
> There are static checkers which complain when we declare variables as
> 64 bit bitfields but only use the lower 32 bits because of shift
> wrapping.  In this case "len" is declared as u64 as opposed to unsigned
> long or something which might be 32 bits.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

