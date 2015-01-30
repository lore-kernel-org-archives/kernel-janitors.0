From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 30 Jan 2015 09:31:55 +0000
Subject: Re: [patch] iio: imu: adis16400: Fix sign extension
Message-Id: <87r3ucty0k.fsf@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130083058.GD21357@mwanda> <54CB41F9.1060800@metafoo.de>
	<20150130092250.GK6507@mwanda>
In-Reply-To: <20150130092250.GK6507@mwanda> (Dan Carpenter's message of "Fri,
	30 Jan 2015 12:22:50 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 30 2015, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Rasmus, are you using a static checker?  Which one?

Sort of:

https://github.com/Villemoes/linux-cocci/blob/master/misc/sign_extend.cocci

Rasmus
