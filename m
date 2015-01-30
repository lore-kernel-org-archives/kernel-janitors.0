From: Lars-Peter Clausen <lars@metafoo.de>
Date: Fri, 30 Jan 2015 08:34:01 +0000
Subject: Re: [patch] iio: imu: adis16400: Fix sign extension
Message-Id: <54CB41F9.1060800@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130083058.GD21357@mwanda>
In-Reply-To: <20150130083058.GD21357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On 01/30/2015 09:30 AM, Dan Carpenter wrote:
> Because of C's type promotion rules, the code shifts in
> "((val16 & 0xFFF) << 4) >> 4;" cancel each other out and they're a
> no-op.
>
> The intention here was to sign-extend then 11th bit so we can use the
> sign_extend32() function.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Please review this carefully.  I'm pretty sure it's correct but this is
> the first time I've ever used the sign_extend32() function.

Hi,

Rasmus already fixed this a couple of days ago.

Thanks,
- Lars
