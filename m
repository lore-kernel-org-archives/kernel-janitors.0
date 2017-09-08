From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Sep 2017 14:05:59 +0000
Subject: Re: [PATCH v2] staging: iio: tsl2x7x: clean up limit checks
Message-Id: <20170908140559.7afomklpxogwnlgt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908105343.tk3j36sgxd7xm222@mwanda>
 <59B29FCA.6070001@bfs.de>
In-Reply-To: <59B29FCA.6070001@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: devel@driverdev.osuosl.org, Lars-Peter Clausen <lars@metafoo.de>, Eva Rachel Retuya <eraretuya@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, simran singhal <singhalsimran0@gmail.com>, Jonathan Cameron <jic23@kernel.org>

On Fri, Sep 08, 2017 at 03:48:58PM +0200, walter harms wrote:
> > -	while (i < (TSL2X7X_MAX_LUX_TABLE_SIZE * 3)) {
> > +	while (i < TSL2X7X_MAX_LUX_TABLE_SIZE) {
> >  		offset += snprintf(buf + offset, PAGE_SIZE, "%u,%u,%u,",
> >  			chip->tsl2x7x_device_lux[i].ratio,
> >  			chip->tsl2x7x_device_lux[i].ch0,
> 
> Is that TSL2X7X_MAX_LUX_TABLE_SIZE needed at all ?

Nope.  Not needed but not harmful.  Adding redundant limit checks is
pretty normal so it's fine.  I'm not going to remove it.

regards,
dan carpenter

