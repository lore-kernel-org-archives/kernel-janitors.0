From: Dan Robertson <dan@dlrobertson.com>
Date: Wed, 15 Jan 2020 17:43:24 +0000
Subject: Re: [PATCH] iio: accel: bma400: integer underflow setting accel scale
Message-Id: <20200115174324.GA29555@nessie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174531.p623ukjibn6kg6zz@kili.mountain>
In-Reply-To: <20200115174531.p623ukjibn6kg6zz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for taking a look at the code and your feedback on the driver!

On Wed, Jan 15, 2020 at 08:45:31PM +0300, Dan Carpenter wrote:
> We put an upper bound on "val2" but we also need to prevent negative
> values.

"val" is not used past the invalid value check. We only use "val" to make sure
that it is in fact 0. AFAIK there is no "upper bound" on "val", it should be
zero or we return -EINVAL. Am I missing something?

Cheers,

 - Dan
