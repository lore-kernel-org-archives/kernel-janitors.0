From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jan 2020 18:09:01 +0000
Subject: Re: [PATCH] iio: accel: bma400: integer underflow setting accel scale
Message-Id: <20200115180518.GF9562@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174531.p623ukjibn6kg6zz@kili.mountain>
 <20200115174324.GA29555@nessie>
In-Reply-To: <20200115174324.GA29555@nessie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Robertson <dan@dlrobertson.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 15, 2020 at 05:43:24PM +0000, Dan Robertson wrote:
> Thanks for taking a look at the code and your feedback on the driver!
> 
> On Wed, Jan 15, 2020 at 08:45:31PM +0300, Dan Carpenter wrote:
> > We put an upper bound on "val2" but we also need to prevent negative
> > values.
> 
> "val" is not used past the invalid value check. We only use "val" to make sure
> that it is in fact 0. AFAIK there is no "upper bound" on "val", it should be
> zero or we return -EINVAL. Am I missing something?

This patch affects "val2" not "val".  ;)

regards,
dan carpenter
