From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 10:23:38 +0000
Subject: Re: [patch] iio: imu: adis16400: Fix sign extension
Message-Id: <20150130102338.GW6456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130083058.GD21357@mwanda>
 <54CB41F9.1060800@metafoo.de>
 <20150130092250.GK6507@mwanda>
 <87r3ucty0k.fsf@rasmusvillemoes.dk>
In-Reply-To: <87r3ucty0k.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 30, 2015 at 10:31:55AM +0100, Rasmus Villemoes wrote:
> On Fri, Jan 30 2015, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > Rasmus, are you using a static checker?  Which one?
> 
> Sort of:
> 
> https://github.com/Villemoes/linux-cocci/blob/master/misc/sign_extend.cocci
> 

Did you find the bug in fm10k_update_xc_addr_pf()?  That's the other bug
I found.

regards,
dan carpenter

